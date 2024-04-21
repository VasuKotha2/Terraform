data "aws_ami" "amiid" {
  owners = ["amazon"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-20240228"]
  }
}
