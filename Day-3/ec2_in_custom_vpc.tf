terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.45.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# to create custom VPC with 198.0.0.0/16
resource "aws_vpc" "my_prod_vpc" {
  cidr_block = "198.0.0.0/16"
}

# to create a subnet with 198.0.0.0/24
resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_prod_vpc.id
  cidr_block = "192.0.0.0/24"
  availability_zone = "ap-south-1a"
}

# to create an ec2 instance in our custom VPC
resource "aws_instance" "myec2instance" {
  ami = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet.id
}
