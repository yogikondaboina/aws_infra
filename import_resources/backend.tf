terraform {
  backend "s3" {
    bucket         = "statesotre"
    key            = "s3import.tfstate" 
    region         = "ap-south-1"
    encrypt        = true
  }
}