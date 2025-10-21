terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

terraform {
  backend "s3" {
    bucket         = "statestores3-d"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
 

# module "s3_bucket" {
#   source          = "./terraform_module/s3"
#   bucket_name     = var.bucket_name
#   acl             = "private"
# }

# module "my_vpc" {
#   source                = "./terraform_module/vpc"
#   vname                 = var.vname
#   vpc_cidr              = var.vpc_cidr
#   public_subnet_cidr    = var.public_subnet_cidr
#   private_subnet_cidr   = var.private_subnet_cidr
#   availability_zones    = var.availability_zones
# }

# EC2 Instance
module "ec2" {
  source     = "./terraform_module/ec2"
  vname      = var.vname
  login_key  = var.login_key
  #subnet_id = data.aws_subnet.public.id
  #sg_id     = data.aws_security_group.ec2_sg.id
}