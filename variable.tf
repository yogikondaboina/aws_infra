variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# Name of the VPC / Environment
variable "vname" {
  description = "The name of the VPC / environment"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

# Public subnet CIDRs
variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Private subnet CIDRs
variable "private_subnet_cidr" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
# Availability Zones
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "login_key" {
  type = string
}