terraform {
  backend "s3" {
    bucket         = "tf-backend-vikash"
    key            = "statefiles/tf-statelock"
    region         = "us-east-1"
    dynamodb_table = "tf-statelock-db"
  }
}


provider "aws" {
  region = "us-east-1"
}