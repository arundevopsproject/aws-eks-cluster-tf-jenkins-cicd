locals {

  common_labels = {

    environment = var.environment

    security = "enabled"

    managed-by = "terraform"
  }
}
