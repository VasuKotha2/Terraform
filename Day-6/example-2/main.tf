terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.46.0"
    }
  }
}

resource "aws_instance" "instance1" {
  ami = data.aws_ami.amiid.id
  instance_type = var.instance_type[count.index]
  count = length(var.instance_type)
  tags = {
    Name = var.instance_name[count.index]
  }
}


