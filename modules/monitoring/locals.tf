locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = "Terraform"

    Module = "monitoring"
  }
}
