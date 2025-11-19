terraform {
  backend "s3" {
    bucket         = "statesotre"
    key            = "s33import.tfstate" 
    region         = "ap-south-1"
    encrypt        = true
  }
}