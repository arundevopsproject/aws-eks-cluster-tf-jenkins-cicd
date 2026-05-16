locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Module      = "security"

    Compliance  = "SOC2-ISO27001"

    Security    = "Enabled"
  }
}

