module "s3_bucket" {
  source          = "./terraform_module/s3"
  host_bucket_name = var.bucket_name  # Root variable passed to module variable
}
 