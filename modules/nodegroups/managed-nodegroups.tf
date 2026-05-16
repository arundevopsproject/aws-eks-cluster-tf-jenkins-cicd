# Managed Node Group
resource "aws_eks_node_group" "this" {

  cluster_name = var.cluster_name

  node_group_name = "${var.environment}-managed-ng"

  node_role_arn = var.nodegroup_role_arn

  subnet_ids = var.private_subnet_ids

  ami_type = var.ami_type

  capacity_type = var.enable_spot ? "SPOT" : var.capacity_type

  disk_size = var.disk_size

  instance_types = var.instance_types

  version = var.cluster_version

  launch_template {

    id = aws_launch_template.this.id

    version = "$Latest"
  }

  scaling_config {

    desired_size = var.desired_size

    min_size = var.min_size

    max_size = var.max_size
  }

  labels = local.labels

  dynamic "taint" {

    for_each = local.taints

    content {

      key    = taint.value.key
      value  = taint.value.value
      effect = taint.value.effect
    }
  }

  update_config {

    max_unavailable = 1
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-managed-nodegroup"
    }
  )

  lifecycle {

    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }
}

