provider "aws" {

  region = var.aws_region

  default_tags {

    tags = {

      Environment = var.environment
      Platform    = "EKS"
      ManagedBy   = "Terraform"
      Owner       = "DevOps-Team"
      Project     = "terraform-eks-platform"
    }
  }
}

