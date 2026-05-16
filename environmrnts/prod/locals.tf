locals {

  common_tags = {

    Project     = var.project_name
    Environment = var.environment

    ManagedBy   = "Terraform"
    Platform    = "EKS"

    Criticality = "High"

    Backup      = "Enabled"
    Monitoring  = "Enabled"

    Compliance  = "SOC2-ISO27001"
  }

  eks_cluster_name = "${var.project_name}-${var.environment}-eks"
}

