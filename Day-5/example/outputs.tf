output "ami_id" {
  value = data.aws_ami.myami.id
}

output "ec2_public_ip_address" {
  value = aws_instance.myec2instance.public_ip
}