# Grafana Ingress
resource "kubernetes_ingress_v1" "grafana" {

  metadata {

    name = "grafana-ingress"

    namespace = kubernetes_namespace.monitoring.metadata[0].name

    annotations = {

      "kubernetes.io/ingress.class" = "alb"

      "alb.ingress.kubernetes.io/scheme" = "internet-facing"

      "alb.ingress.kubernetes.io/target-type" = "ip"
    }
  }

  spec {

    rule {

      host = var.grafana_hostname

      http {

        path {

          path = "/"

          path_type = "Prefix"

          backend {

            service {

              name = "kube-prometheus-stack-grafana"

              port {

                number = 80
              }
            }
          }
        }
      }
    }
  }
}

