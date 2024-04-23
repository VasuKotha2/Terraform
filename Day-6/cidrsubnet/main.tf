terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.46.0"
    }
  }
}

provider "aws" {
  region = var.my_region
}

resource "aws_vpc" "prod_vpc" {
  cidr_block = var.prod_cidr
  tags = {
    Name = "my_vpc"
  }
}

data "aws_availability_zones" "myaz" {}
output "aws_availability_zones" {
  value = data.aws_availability_zones.myaz.names
}

resource "aws_subnet" "prod_subnet" {
  count = var.prod_subnet
  vpc_id = aws_vpc.prod_vpc.id
  cidr_block = cidrsubnet(var.prod_cidr,8,count.index)
  availability_zone = "${data.aws_availability_zones.myaz.names[count.index+1]}"
  tags = {
    Name = "Subnet - ${count.index+1}"
  }
}