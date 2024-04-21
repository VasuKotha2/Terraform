variable "instance_type" {
  type = list(string)
  default = ["t4g.micro","t4g.nano"]
}

variable "instance_name" {
  type = string
  default = "server"
}