terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.46.0"
    }
  }
}

#vpc creation
resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidrvalue
    tags = {
      Name = var.my_vpc
    }
}

#internet gateway creation
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = var.my_igw_name
  }
}
/*
resource "aws_internet_gateway_attachment" "my-attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.myvpc.id
}
*/
#subnet creation
resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnet_cidrvalue
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.my_subnet
  }
}

# public and private key creation
resource "tls_private_key" "publicKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# key pair creation
resource "aws_key_pair" "mykeypair" {
  key_name   = "demo"
  public_key = tls_private_key.publicKey.public_key_openssh
}

# downloading private key onto the local machine
resource "local_file" "privateKey" {
  content  = tls_private_key.publicKey.private_key_openssh
  filename = "/Users/vasukotha/downloads/tfkey.pem"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    # SSH Port 22 allowed from any IP
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      # SSH Port 80 allowed from any IP
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance creation
resource "aws_instance" "myec2instance" {
  ami                         = data.aws_ami.myami.id
  subnet_id                   = aws_subnet.mysubnet.id
  key_name                    = aws_key_pair.mykeypair.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "Server-1"
  }
  security_groups = [aws_security_group.allow_ssh.id]
  user_data = "${file("installapache.sh")}"
}


