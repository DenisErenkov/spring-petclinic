provider "aws" {
  region = "eu-north-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

terraform {
 backend "s3" {
 bucket = "s3-denys1-petclinic-bucket"
 key    = "terraform.tfstate"
 region = "eu-north-1"
  }
}


