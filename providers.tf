provider "aws" {

  # profile = "terraform"
  region  = "eu-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
