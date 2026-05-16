# Launch Template
resource "aws_launch_template" "this" {

  name_prefix = "${var.environment}-${var.cluster_name}-lt"

  update_default_version = true

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = var.disk_size

      volume_type = "gp3"

      encrypted = true

      delete_on_termination = true
    }
  }

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2
  }

  monitoring {

    enabled = true
  }

  tag_specifications {

    resource_type = "instance"

    tags = merge(

      local.common_tags,

      {
        Name = "${var.environment}-eks-worker"
      }
    )
  }

  user_data = base64encode(templatefile("${path.module}/userdata.sh", {

    cluster_name = var.cluster_name
  }))
}


