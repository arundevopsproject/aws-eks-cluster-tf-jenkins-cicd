# Secrets Encryption already enabled in cluster.tf

# Additional KMS policy can be added here.
resource "aws_kms_alias" "eks" {

  name = "alias/${var.cluster_name}-eks"

  target_key_id = replace(
    var.kms_key_arn,
    "arn:aws:kms:ap-south-1:111111111111:key/",
    ""
  )
}


