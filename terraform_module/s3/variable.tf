variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default = "hosts-1A"
}

variable "acl" {
  description = "The ACL for the S3 bucket (e.g., private, public-read)"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
