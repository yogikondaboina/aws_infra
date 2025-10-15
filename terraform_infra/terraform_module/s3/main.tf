resource "aws_s3_bucket" "this" {
  bucket = varbucket_name
  acl    = var
}
