output "aws_region" {

  description = "AWS Region"
  value       = var.aws_region
}

output "environment" {

  description = "Deployment Environment"
  value       = var.environment
}

output "project_name" {

  description = "Project Name"
  value       = var.project_name
}

output "common_tags" {

  description = "Common Tags"
  value       = local.common_tags
}

output "eks_cluster_name" {

  description = "Generated EKS Cluster Name"
  value       = local.eks_cluster_name
}