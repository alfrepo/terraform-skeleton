terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    # Variables may not be used here. Unfortunately.
    # redundant declaration introduced. Need preprocessor to get rid of it.
    bucket = "alf-dev-terraform-state"
    key    = "alf-dev-tf-skelletton/env1"
    region = "eu-central-1"
  }

}

provider "aws" {
  profile = "default"
  region  = local.aws_region
}

