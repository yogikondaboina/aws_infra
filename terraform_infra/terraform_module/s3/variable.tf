variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "Access control list for the bucket"
 }

