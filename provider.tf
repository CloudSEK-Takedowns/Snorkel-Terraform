terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73.0"
    }
  }
}

provider "aws" {
    region = "${var.AWS_REGION}"
    shared_credentials_file = "/Users/cbit011150/.aws/credentials"
    profile = "cloudbeginners"
}
