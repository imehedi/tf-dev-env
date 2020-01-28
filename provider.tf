terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "imehedi-test-statefiles"
    key    = "2020/jan/28/tf-exp/"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}

