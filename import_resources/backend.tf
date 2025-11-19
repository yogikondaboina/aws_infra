terraform {
  backend "s3" {
    bucket         = "statesotre"
    key            = "s3imp.tfstate" 
    region         = "ap-south-1"
    encrypt        = true
  }
}