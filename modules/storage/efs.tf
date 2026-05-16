# EFS File System
resource "aws_efs_file_system" "this" {

  creation_token = "${var.environment}-efs"

  encrypted = true

  performance_mode = "generalPurpose"

  throughput_mode = "bursting"

  tags = {

    Name        = "${var.environment}-efs"

    Environment = var.environment

    ManagedBy   = "Terraform"
  }
}

# EFS Mount Targets
resource "aws_efs_mount_target" "this" {

  count = length(var.private_subnet_ids)

  file_system_id = aws_efs_file_system.this.id

  subnet_id = var.private_subnet_ids[count.index]

  security_groups = [
    var.efs_security_group_id
  ]
}

