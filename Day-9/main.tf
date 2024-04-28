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
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    Name = "my_gateway"
  }
}

data "aws_availability_zones" "myaz" {}
output "aws_availability_zones" {
  value = data.aws_availability_zones.myaz.names
}

resource "aws_subnet" "prod_subnet" {
  count = var.prod_subnet
  vpc_id = aws_vpc.prod_vpc.id
  map_public_ip_on_launch = true
  cidr_block = cidrsubnet(var.prod_cidr,8,count.index)
  availability_zone = "${data.aws_availability_zones.myaz.names[count.index+1]}"
  tags = {
    Name = "Subnet - ${count.index+1}"
  }
}


  resource "aws_instance" "instance1" {
  ami = data.aws_ami.amiid.id
  instance_type = var.instance_type[count.index]
  count = length(var.instance_type)
  key_name = data.aws_key_pair.my_key_pair.key_name
  #availability_zone = "${data.aws_availability_zones.myaz.names[count.index]}"
  subnet_id = aws_subnet.prod_subnet[count.index].id

  tags = {
    Name = var.instance_name[count.index]
  }
}

