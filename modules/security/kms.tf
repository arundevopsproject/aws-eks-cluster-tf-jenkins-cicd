# KMS Key
resource "aws_kms_key" "eks" {

  description = "EKS Encryption Key"

  enable_key_rotation = true

  deletion_window_in_days = 30

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-eks-kms-key"
    }
  )
}

# KMS Alias
resource "aws_kms_alias" "eks" {

  name = "alias/${var.environment}-eks-key"

  target_key_id = aws_kms_key.eks.key_id
}



