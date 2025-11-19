terraform {
  backend "s3" {
    bucket         = "statesotre"
    key            = "s3impor.tfstate" 
    region         = "ap-south-1"
    encrypt        = true
  }
}