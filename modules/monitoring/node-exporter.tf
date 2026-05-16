# Prometheus Node Exporter
resource "helm_release" "node_exporter" {

  name = "prometheus-node-exporter"

  repository = "https://prometheus-community.github.io/helm-charts"

  chart = "prometheus-node-exporter"

  namespace = kubernetes_namespace.monitoring.metadata[0].name

  timeout = 600
}

