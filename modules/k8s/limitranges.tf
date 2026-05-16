# Limit Ranges
resource "kubernetes_limit_range_v1" "limits" {

  for_each = kubernetes_namespace.namespaces

  metadata {

    name = "default-limits"

    namespace = each.value.metadata[0].name
  }

  spec {

    limit {

      type = "Container"

      default = {

        cpu = "500m"

        memory = "512Mi"
      }

      default_request = {

        cpu = "250m"

        memory = "256Mi"
      }
    }
  }
}

