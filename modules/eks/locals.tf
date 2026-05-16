locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Module      = "eks"

    Platform    = "kubernetes"

    Security    = "enabled"
  }
}
