# S3 Bucket
resource "aws_s3_bucket" "config" {

  bucket = "${var.environment}-config-bucket"

  tags = local.common_tags
}

# IAM Role
resource "aws_iam_role" "config" {

  name = "${var.environment}-config-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Principal = {
          Service = "config.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Config Recorder
resource "aws_config_configuration_recorder" "this" {

  count = var.enable_config ? 1 : 0

  name = "${var.environment}-config-recorder"

  role_arn = aws_iam_role.config.arn
}

