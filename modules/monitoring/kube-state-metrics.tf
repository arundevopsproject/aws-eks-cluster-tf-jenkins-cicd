# kube-state-metrics Helm
resource "helm_release" "kube_state_metrics" {

  name = "kube-state-metrics"

  repository = "https://prometheus-community.github.io/helm-charts"

  chart = "kube-state-metrics"

  namespace = kubernetes_namespace.monitoring.metadata[0].name

  timeout = 600
}
