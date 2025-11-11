terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }
    backend "s3" {
    bucket = "amzn-digger-demo-s3"              # Change if a different S3 bucket name was used for the backend 
    key    = "terraform/state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "unique-sample-bucket-terraform-111125"
  acl    = "private"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}
