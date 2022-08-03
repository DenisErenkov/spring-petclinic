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

data "template_file" "user_data" {
  template = file("user-data.sh.tpl")
  vars = {
    db_url = aws_db_instance.default.address
  }
}

