locals {

  common_labels = {

    environment = var.environment

    managed-by = "terraform"

    platform = "eks"
  }
}
