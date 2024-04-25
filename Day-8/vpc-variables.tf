# VPC Name

variable "vpc_name" {
  type = string
  default = "myvpc"
}

# VPC CIDR block

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

# VPC Availability zone
variable "vpc_availability_zones" {
  type = list(string)
  default = [ "us-east-1a", "us-east-1b" ]
}

# VPC public subnets

variable "vpc_public_subnets" {
  type = list(string)
  default = ["10.0.101.0/24","10.0.102.0/24"]
}

# VPC private subnets
variable "vpc_private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

# VPC Database subnets

variable "vpc_database_subnets" {
  type = list(string)
  default = ["10.0.151.0/24","10.0.152.0/24"]
}

# VPC create database subnet route table

variable "vpc_create_database_subnet_route_table" {
  type = bool
  default = true
}

# VPC enable nat gateway
variable "vpc_enable_nat_gateway" {
  type = bool
  default = true
}
# VPC single nat gateway

variable "vpc_single_nat_gateway" {
  type = bool
  default = true
}

