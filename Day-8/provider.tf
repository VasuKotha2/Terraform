# Provider information

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.40"
    }
  }
}

provider "aws" {
  region = var.aws_region
}