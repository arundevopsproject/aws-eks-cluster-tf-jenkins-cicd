# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "eks" {

  name = var.cloudwatch_log_group_name

  retention_in_days = var.log_retention_days

  tags = local.common_tags
}

