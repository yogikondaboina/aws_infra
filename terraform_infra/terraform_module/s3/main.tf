resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = var.acl
}