# Namespace Outputs
output "namespaces" {

  value = keys(kubernetes_namespace.namespaces)
}

# Priority Classes
output "priority_classes" {

  value = [

    kubernetes_priority_class_v1.high_priority.metadata[0].name,

    kubernetes_priority_class_v1.critical_priority.metadata[0].name
  ]
}

# Readonly Cluster Role
output "readonly_cluster_role" {

  value = kubernetes_cluster_role.readonly.metadata[0].name
}

