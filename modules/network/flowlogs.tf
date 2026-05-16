# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {

  name = "/aws/vpc/flowlogs/${var.environment}"

  retention_in_days = var.flow_log_retention_days
}

# IAM Role 
resource "aws_iam_role" "flow_logs" {

  name = "${var.environment}-flowlogs-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Action = "sts:AssumeRole"

        Effect = "Allow"

        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy
resource "aws_iam_role_policy" "flow_logs" {

  name = "${var.environment}-flowlogs-policy"

  role = aws_iam_role.flow_logs.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Action = [

          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]

        Effect = "Allow"

        Resource = "*"
      }
    ]
  })
}

# VPC Flow Logs capture information about the IP traffic going to and from network interfaces in your VPC. Flow log data can be published to Amazon CloudWatch Logs or Amazon S3. You can use flow logs to troubleshoot why specific traffic is not reaching an instance, which can be helpful when troubleshooting security group rules. You can also use flow logs as a security tool to monitor the traffic that is reaching your instance.
resource "aws_flow_log" "this" {

  count = var.enable_flow_logs ? 1 : 0

  iam_role_arn = aws_iam_role.flow_logs.arn

  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn

  traffic_type = "ALL"

  vpc_id = aws_vpc.this.id
}


