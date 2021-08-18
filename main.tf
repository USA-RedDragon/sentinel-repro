provider "aws" {
  region = "us-east-2"
}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
    aws = {
      source  = "hashicorp/aws"
    }
  }

  required_version = ">= 0.15"

  backend "remote" {
    organization = "jamcswain"

    workspaces {
      name = "sentinel-repro"
    }
  }

}

resource "aws_ssm_parameter" "global_lifecycle" {
  name  = "/global/Lifecycle"
  type  = "String"
  value = "/global/Lifecycle"
}

resource "aws_ssm_parameter" "global_lifecycle_type" {
  name  = "/global/LifecycleType"
  type  = "String"
  value = "/global/LifecycleType"
}
