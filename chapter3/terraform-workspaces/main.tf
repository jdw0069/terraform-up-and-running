resource "aws_instance" "example" {
  ami = "ami-00874d747dde814fa"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}

terraform {
 backend "s3" {
    bucket = "terraform-up-and-running-state-jd" 
    key = "workspaces-example/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-up-and-running-locks-jd" 
    encrypt = true
 }   
}