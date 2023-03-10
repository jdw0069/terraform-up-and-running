provider "aws" {
  region = "us-east-1"
  profile = "terraform-user-demo"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-jd-demo"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
    profile = "terraform-user-demo"
    dynamodb_table = "terraform-up-and-running-locks-jd"
    encrypt        = true
  }
}