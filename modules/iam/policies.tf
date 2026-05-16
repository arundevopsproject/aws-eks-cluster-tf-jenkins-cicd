# EBS CSI Policy
resource "aws_iam_policy" "ebs_csi" {

  name = "${var.environment}-ebs-csi-policy"

  policy = file("${path.module}/policies/ebs-csi-policy.json")
}

# EFS CSI Policy
resource "aws_iam_policy" "efs_csi" {

  name = "${var.environment}-efs-csi-policy"

  policy = file("${path.module}/policies/efs-csi-policy.json")
}

# External DNS Policy
resource "aws_iam_policy" "external_dns" {

  name = "${var.environment}-external-dns-policy"

  policy = file("${path.module}/policies/external-dns-policy.json")
}

