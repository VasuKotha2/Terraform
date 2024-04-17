terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

resource "aws_vpc" "UATVpc" {
  cidr_block = var.vpccidr_value
  tags = {
    Name = var.vpc_tagname
  }
}

resource "aws_subnet" "UATSubnet" {
  vpc_id            = aws_vpc.UATVpc.id
  cidr_block        = var.subnet_cidr_value
  availability_zone = var.subnet_availability_zone
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_instance" "UAT_instance" {
  ami = var.ami_id_southregion
  subnet_id = aws_subnet.UATSubnet.id
  instance_type = var.instance_type_value
  provider = aws.southregion
}

resource "aws_instance" "myinstance" {
  ami = var.ami_id_westregion
  instance_type = var.instance_type_value
  provider = aws.westregion
}