terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# vpc creation
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc-1"
  }
}

#subnet creation
resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
}

# ami creation
data "aws_ami" "myami" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
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

# EC2 instance creation
resource "aws_instance" "myec2instance" {
  ami                         = data.aws_ami.myami.id
  subnet_id                   = aws_subnet.mysubnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykeypair.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "Server-1"
  }
}

