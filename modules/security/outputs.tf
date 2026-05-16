output "eks_cluster_sg_id" {

  value = aws_security_group.eks_cluster.id
}

output "nodegroup_sg_id" {

  value = aws_security_group.nodegroup.id
}

output "bastion_sg_id" {

  value = aws_security_group.bastion.id
}

output "kms_key_arn" {

  value = aws_kms_key.eks.arn
}

output "waf_acl_arn" {

  value = aws_wafv2_web_acl.eks.arn
}

