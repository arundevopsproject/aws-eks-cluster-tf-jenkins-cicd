# Alertmanager Config Secret
resource "kubernetes_secret" "alertmanager" {

  metadata {

    name = "alertmanager-config"

    namespace = kubernetes_namespace.monitoring.metadata[0].name
  }

  data = {

    "alertmanager.yaml" = <<EOF
global:
  resolve_timeout: 5m

route:
  receiver: default

receivers:
- name: default
EOF
  }

  type = "Opaque"
}


