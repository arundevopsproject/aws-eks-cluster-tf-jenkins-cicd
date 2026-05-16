# CloudWatch Metrics
resource "aws_cloudwatch_metric_alarm" "eks_api_errors" {

  alarm_name = "${var.cluster_name}-api-errors"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 1

  metric_name = "5xxError"

  namespace = "AWS/EKS"

  period = 300

  statistic = "Sum"

  threshold = 5

  alarm_description = "EKS API server errors"

  dimensions = {

    ClusterName = var.cluster_name
  }
}

