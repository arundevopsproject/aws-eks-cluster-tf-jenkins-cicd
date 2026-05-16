terraform {

  required_version = ">= 1.6.0"

  required_providers {

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.14"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.32"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58"
    }
  }
}
