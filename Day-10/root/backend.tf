terraform {
  backend "s3" {
    bucket = "my-terraform-backend-bucket-1"
    key    = "backend/myteraformbackend.tfstate"
    region = "us-west-1"
    dynamodb_table = "remote-backend"
  }
}