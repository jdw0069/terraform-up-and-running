provider "aws" {
    region = "us-east-1"
}

terraform {
 backend "s3" {
    bucket = "terraform-up-and-running-state-jd" 
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-up-and-running-locks-jd" 
    encrypt = true
 }   
}