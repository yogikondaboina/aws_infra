variable "bucket_name" {
  type        = string
  default = "Host_s3"
  description = "Name of the S3 bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "Access control list for the bucket"
 }

