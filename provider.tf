provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}