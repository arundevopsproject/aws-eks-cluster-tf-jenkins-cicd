# Error Metric Filter
resource "aws_cloudwatch_log_metric_filter" "errors" {

  name = "${var.environment}-error-filter"

  log_group_name = aws_cloudwatch_log_group.eks.name

  pattern = "ERROR"

  metric_transformation {

    name = "ErrorCount"

    namespace = "EKS/Logs"

    value = "1"
  }
}

# Alarm
resource "aws_cloudwatch_metric_alarm" "errors" {

  alarm_name = "${var.environment}-eks-errors"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 1

  metric_name = "ErrorCount"

  namespace = "EKS/Logs"

  period = 300

  statistic = "Sum"

  threshold = 10

  alarm_description = "High number of errors detected"
}
