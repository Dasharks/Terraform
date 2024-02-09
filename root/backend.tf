terraform {
  backend "s3" {
    bucket = "Please enter your bucket name"
    key = "terraform_state_file/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Please enter your Dynamo-DB-Table name"
  }
}
