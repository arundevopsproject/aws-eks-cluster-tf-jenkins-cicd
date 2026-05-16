locals {

  common_tags = {

    Project     = var.project_name
    Environment = var.environment

    ManagedBy   = "Terraform"

    Platform    = "EKS"

    Criticality = "Medium"

    Monitoring  = "Enabled"

    Backup      = "Optional"

    AutoShutdown = "Enabled"

    CostOptimized = "True"
  }

  eks_cluster_name = "${var.project_name}-${var.environment}-eks"
}
