# IRSA for Cluster Autoscaler

#1 Trust Policy
data "aws_iam_policy_document" "cluster_autoscaler_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        var.oidc_provider_arn
      ]
    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:cluster-autoscaler"
      ]
    }
  }
}

#2 IRSA Role
resource "aws_iam_role" "cluster_autoscaler" {

  name = "${var.environment}-cluster-autoscaler-irsa"

  assume_role_policy = data.aws_iam_policy_document.cluster_autoscaler_assume_role.json

  tags = local.common_tags
}

#3 Policy
resource "aws_iam_policy" "cluster_autoscaler" {

  name = "${var.environment}-cluster-autoscaler-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [

          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions"
        ]

        Resource = "*"
      }
    ]
  })
}

#4 Attach Policy
resource "aws_iam_role_policy_attachment" "cluster_autoscaler_attach" {

  role = aws_iam_role.cluster_autoscaler.name

  policy_arn = aws_iam_policy.cluster_autoscaler.arn
}



