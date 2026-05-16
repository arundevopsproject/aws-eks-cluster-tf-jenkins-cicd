# KMS Key
resource "aws_kms_key" "secrets" {

  description = "KMS key for EKS secrets encryption"

  enable_key_rotation = true

  deletion_window_in_days = 30

  tags = local.common_tags
}

# KMS Alias
resource "aws_kms_alias" "secrets" {

  name = "alias/${var.environment}-eks-secrets"

  target_key_id = aws_kms_key.secrets.key_id
}

