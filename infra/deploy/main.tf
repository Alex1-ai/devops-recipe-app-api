terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"  # or latest
    }

  }


  backend "s3" {
    bucket               = "devop-recipe-app-tf-state"
    key                  = "tf-state-deploy"
    workspace_key_prefix = "tf-state-deploy-env"
    region               = "us-east-1"
    encrypt              = true
    dynamodb_table       = "devop-recipe-app-api-tf-lock"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/deploy"
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws_region" "current" {}
