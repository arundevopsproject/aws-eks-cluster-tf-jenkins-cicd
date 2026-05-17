locals {

  common_tags = {

    Environment = var.environment
    Platform    = "EKS"
    ManagedBy   = "Terraform"
    Owner       = "DevOps-Team"
  }
}
