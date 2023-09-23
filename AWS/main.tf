provider "aws" {
  region = "us-west-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
  backend "s3" {
    key    = "ecs/terraform.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-name"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
