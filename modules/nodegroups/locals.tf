locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Module      = "nodegroups"

    Platform    = "eks"
  }

  labels = {

    role        = "worker"
    environment = var.environment
  }

  taints = [
    {
      key    = "dedicated"
      value  = "apps"
      effect = "NO_SCHEDULE"
    }
  ]
}
