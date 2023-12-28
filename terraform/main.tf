provider "aws" {
  region = "us-east-1"  # Замініть на свою регіон AWS
}

terraform {
  backend "s3" {
    bucket         = "petrov-pavlo-2023-11-20"
    key            = "aws/main/terraform.tfstate"
    region         = "us-east-1"  # Замініть на свою регіон AWS
    encrypt        = truete
  }
}

