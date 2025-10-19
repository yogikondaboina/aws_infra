###################################
# VPC Module Variables
###################################

# Name of the VPC / Environment
variable "vname" {
  description = "The name of the VPC / environment"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.1/24"
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
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}   # Optional: default empty map
}