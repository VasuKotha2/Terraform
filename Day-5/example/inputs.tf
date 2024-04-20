
variable "vpc_cidrvalue" {
 type = string
 default  =  "10.0.0.0/16"
}

variable "my_vpc" {
  type = string
  default = "my_vpc"
}

variable "my_igw_name" {
  type = string
  default = "my-gateway"
}
variable "subnet_cidrvalue" {
 type = string
 default  =  "10.0.0.0/24"
}
variable "my_subnet" {
    type = string
    default = "my_subnet"
}

variable "availability_zone" {
  type = string
  default = "ap-south-1a"
}
