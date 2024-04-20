terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.46.0"
    }
  }
}

resource "aws_instance" "instance_web" {
  ami = var.instance_ami_web.web
  instance_type = var.instance_instancetype.web
}

resource "aws_instance" "instance_app" {
  ami = var.instance_ami_web.app
  instance_type = var.instance_instancetype.app
}