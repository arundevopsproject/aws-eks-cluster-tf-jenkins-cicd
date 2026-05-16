output "nodegroup_name" {

  value = aws_eks_node_group.this.node_group_name
}

output "nodegroup_arn" {

  value = aws_eks_node_group.this.arn
}

output "nodegroup_status" {

  value = aws_eks_node_group.this.status
}

output "autoscaling_group_names" {

  value = aws_eks_node_group.this.resources[0].autoscaling_groups[*].name
}

