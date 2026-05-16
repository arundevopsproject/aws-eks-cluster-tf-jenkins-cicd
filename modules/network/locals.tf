locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Module      = "network"

    Platform    = "eks"
  }

  cluster_name = "enterprise-${var.environment}-eks"
}
