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