variable "vpccidr_value" {
  type    = string
}

variable "vpc_tagname" {
  type    = string
}

variable "subnet_cidr_value" {
  type    = string
  
}
variable "subnet_name" {
  type = string
}
variable "subnet_availability_zone" {
  type    = string
 
}

variable "ami_id_southregion" {
  type = string
  default = "ami-007020fd9c84e18c7"
}

variable "ami_id_westregion" {
  type = string
  default = "ami-08116b9957a259459"
}

variable "instance_type_value" {
  type = string
  default = "t2.micro"
}