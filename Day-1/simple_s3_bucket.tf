terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.45.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "My-bucket-demo-uat"
}