variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Canned ACL for the bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "logging_bucket" {
  description = "Optional S3 bucket to store access logs"
  type        = string
  default     = null
}

variable "logging_prefix" {
  description = "Prefix for S3 access logs"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "bucket_policy" {
  description = "Optional JSON policy for the bucket"
  type        = string
  default     = null
}
