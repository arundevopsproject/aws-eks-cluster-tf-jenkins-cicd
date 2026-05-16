# CloudWatch Retention Policy
resource "aws_cloudwatch_log_resource_policy" "this" {

  policy_name = "${var.environment}-log-policy"

  policy_document = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Sid = "AllowCloudWatchLogs"

        Effect = "Allow"

        Principal = {

          Service = "logs.amazonaws.com"
        }

        Action = [

          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]

        Resource = "*"
      }
    ]
  })
}

