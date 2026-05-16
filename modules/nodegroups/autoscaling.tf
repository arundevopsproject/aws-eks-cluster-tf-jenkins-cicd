# Autoscaling Policy
resource "aws_autoscaling_policy" "cpu_scale_out" {

  name = "${var.environment}-cpu-scale-out"

  autoscaling_group_name = aws_eks_node_group.this.resources[0].autoscaling_groups[0].name

  adjustment_type = "ChangeInCapacity"

  scaling_adjustment = 1

  cooldown = 300
}

# CloudWatch Alarm High CPU
resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "${var.environment}-high-cpu"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 75

  dimensions = {

    AutoScalingGroupName = aws_eks_node_group.this.resources[0].autoscaling_groups[0].name
  }

  alarm_description = "High CPU utilization"
}

