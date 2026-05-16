# Resource Quotas
resource "kubernetes_resource_quota_v1" "quota" {

  for_each = kubernetes_namespace.namespaces

  metadata {

    name = "resource-quota"

    namespace = each.value.metadata[0].name
  }

  spec {

    hard = {

      "requests.cpu" = "10"

      "requests.memory" = "20Gi"

      "limits.cpu" = "20"

      "limits.memory" = "40Gi"

      "pods" = "100"
    }
  }
}

