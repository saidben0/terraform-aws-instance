terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    #cloudinit = {
    #  source = "hashicorp/cloudinit"
    #  version = "2.2.0"
    #}
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "sben"
  region  = "us-east-1"
}

#provider "cloudinit" {
#  # Configuration options
#}
