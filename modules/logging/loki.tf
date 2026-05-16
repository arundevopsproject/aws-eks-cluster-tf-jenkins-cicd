# Loki Helm Release
resource "helm_release" "loki" {

  name = "loki"

  repository = "https://grafana.github.io/helm-charts"

  chart = "loki"

  namespace = kubernetes_namespace.logging.metadata[0].name

  timeout = 900

  values = [

    yamlencode({

      persistence = {

        enabled = true

        storageClassName = var.storage_class

        size = "50Gi"
      }
    })
  ]
}

