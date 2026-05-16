# Logging Namespace
output "logging_namespace" {

  value = kubernetes_namespace.logging.metadata[0].name
}

# CloudWatch Log Group
output "cloudwatch_log_group_name" {

  value = aws_cloudwatch_log_group.eks.name
}

# Loki Release
output "loki_release_name" {

  value = helm_release.loki.name
}

# Fluent Bit Release
output "fluentbit_release_name" {

  value = helm_release.fluentbit.name
}

