provider "aws" {
  region  = "us-east-2"
  profile = "flipper"
}

terraform {
  backend "s3" {
    bucket  = "rust-lambda-terraform"
    key     = "terraform-state.tfstate"
    region  = "us-east-2"
    profile = "flipper"
  }
}
