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