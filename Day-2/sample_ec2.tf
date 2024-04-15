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

resource "aws_instance" "my_ec2_sample_instace" {
  ami = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
}