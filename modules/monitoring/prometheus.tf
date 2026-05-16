# Monitoring Namespace
resource "kubernetes_namespace" "monitoring" {

  metadata {

    name = "monitoring"
  }
}

# kube-prometheus-stack
resource "helm_release" "prometheus_stack" {

  name = "kube-prometheus-stack"

  repository = "https://prometheus-community.github.io/helm-charts"

  chart = "kube-prometheus-stack"

  namespace = kubernetes_namespace.monitoring.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      grafana = {

        enabled = true
      }

      prometheus = {

        prometheusSpec = {

          retention = "15d"

          storageSpec = {

            volumeClaimTemplate = {

              spec = {

                storageClassName = var.storage_class

                accessModes = [
                  "ReadWriteOnce"
                ]

                resources = {

                  requests = {

                    storage = "100Gi"
                  }
                }
              }
            }
          }
        }
      }
    })
  ]
}

