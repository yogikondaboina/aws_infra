module "s3_bucket" {
  source      = "./terraform_module/s3"
  bucket_name = "my-terraform-s3-bucket"
  acl         = "private"
}
