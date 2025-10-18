terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "store-state-d"
    key    = "s3-state"
    region = "us-east-1"
  }
}

module "s3_bucket" {
  source          = "./terraform_module/s3"
  bucket_name     = var.bucket_name
  acl             = "private"

  tags = {
    Environment = "Dev"
    Project     = "S3 Module Demo"
  }
}

