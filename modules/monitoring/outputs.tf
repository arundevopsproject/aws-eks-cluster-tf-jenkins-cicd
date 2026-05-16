# Monitoring Namespace
output "monitoring_namespace" {

  value = kubernetes_namespace.monitoring.metadata[0].name
}

# Grafana URL
output "grafana_url" {

  value = "https://${var.grafana_hostname}"
}

# Prometheus Release
output "prometheus_release_name" {

  value = helm_release.prometheus_stack.name
}

# CloudWatch Dashboard
output "cloudwatch_dashboard_name" {

  value = aws_cloudwatch_dashboard.eks.dashboard_name
}

