variable "prod_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "prod_subnet" {
  type = number
  default = 3
}
variable "my_region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = list(string)
  default = ["t2.micro","t2.micro","t2.micro"]
}

variable instance_name {
    type = list(string)
    default = [ "web" ,"app","db"]
}

data "aws_ami" "amiid" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240411"]
  }
}
data "aws_key_pair" "my_key_pair" {
  key_name = "us-east-1"
  include_public_key = true
}