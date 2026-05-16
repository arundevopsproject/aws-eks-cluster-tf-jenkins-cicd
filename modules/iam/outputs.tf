output "eks_cluster_role_arn" {

  value = aws_iam_role.eks_cluster_role.arn
}

output "nodegroup_role_arn" {

  value = aws_iam_role.nodegroup_role.arn
}

output "cluster_autoscaler_role_arn" {

  value = aws_iam_role.cluster_autoscaler.arn
}

output "ebs_csi_policy_arn" {

  value = aws_iam_policy.ebs_csi.arn
}

output "efs_csi_policy_arn" {

  value = aws_iam_policy.efs_csi.arn
}

