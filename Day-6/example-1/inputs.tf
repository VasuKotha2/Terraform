variable "instance_type" {
  type = list(string)
  default = ["t4g.micro","t4g.nano"]
}

variable "instance_name" {
  type = list(string)
  default = ["web","app"]
}