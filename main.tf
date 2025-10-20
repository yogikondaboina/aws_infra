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

variable "vpc_id" {}


provider "aws" {
  region = var.aws_region
}
 
 ######### data sources ########
data "aws_vpc" "data_vpc" {
  id = 596122389379
}

data "aws_subnets" "public" {
  filter {
    name   = data.aws_vpc.data_vpc
    values = [data.aws_vpc.(10.0.1.0/24", "10.0.2.0/24)]
  }

  filter {
    name   = "tag:string"
    values = ["Public"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = data.aws_vpc.data_vpc
    values = [data.aws_vpc.(10.0.3.0/24", "10.0.4.0/24)]
  }

  filter {
    name   = "tag:string"
    values = ["private"]
  }
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