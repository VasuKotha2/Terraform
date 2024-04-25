# AWS Region
variable "aws_region" {
  description = "Region in which aws resources are to be created"
  type = string
  default = "us-east-1"
}

# Environment variables

variable "environment" {
  description = "Environment variable for our project"
  type = string
  default = "dev"
}

# Business division

variable "business_division" {
  description = "Business division for HR department"
  type = string
  default = "HR"
}


