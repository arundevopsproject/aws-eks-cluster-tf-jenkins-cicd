# Application Namespaces
resource "kubernetes_namespace" "namespaces" {

  for_each = toset(var.application_namespaces)

  metadata {

    name = each.value

    labels = merge(

      local.common_labels,

      {
        name = each.value
      }
    )
  }
}

