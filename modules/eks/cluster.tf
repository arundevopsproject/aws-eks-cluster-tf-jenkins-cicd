# EKS Cluster
resource "aws_eks_cluster" "this" {

  name = var.cluster_name

  version = var.eks_version

  role_arn = var.cluster_role_arn

  enabled_cluster_log_types = var.enabled_cluster_log_types

  vpc_config {

    subnet_ids = var.private_subnet_ids

    endpoint_private_access = var.endpoint_private_access

    endpoint_public_access = var.endpoint_public_access
  }

  encryption_config {

    provider {

      key_arn = var.kms_key_arn
    }

    resources = [
      "secrets"
    ]
  }

  access_config {

    authentication_mode = "API_AND_CONFIG_MAP"

    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(

    local.common_tags,

    {
      Name = var.cluster_name
    }
  )
}

