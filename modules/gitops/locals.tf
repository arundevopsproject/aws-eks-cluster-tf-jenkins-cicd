locals {

  common_labels = {

    environment = var.environment

    platform = "gitops"

    managed-by = "terraform"
  }
}
