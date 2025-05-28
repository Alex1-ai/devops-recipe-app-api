terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
    time = { # Add the time provider
      source  = "hashicorp/time"
      version = "0.13.1"
    }
  }

  backend "s3" {
    bucket         = "devop-recipe-app-tf-state"
    key            = "tf-state-setup"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "devop-recipe-app-api-tf-lock"
  }
}


provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
