locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Module      = "iam"

    Platform    = "eks"

    Security    = "enabled"
  }
}
