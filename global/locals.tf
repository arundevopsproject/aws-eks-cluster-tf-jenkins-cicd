locals {

  common_tags = {

    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    CostCenter  = var.cost_center

    ManagedBy   = "Terraform"
    Provisioner = "IaC"

    Terraform   = "true"
    Platform    = "EKS"

    Security    = "Enabled"
    Monitoring  = "Enabled"

    Backup      = "Enabled"

    Compliance  = "SOC2-ISO27001"

    CreatedBy   = "DevOps-Team"
  }

  naming_prefix = "${var.project_name}-${var.environment}"

  eks_cluster_name = "${local.naming_prefix}-eks"

  common_k8s_labels = {

    environment = var.environment
    managed-by  = "terraform"
    platform    = "eks"
  }
}