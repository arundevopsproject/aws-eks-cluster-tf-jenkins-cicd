# Read Only Cluster Role
resource "kubernetes_cluster_role" "readonly" {

  metadata {

    name = "readonly-role"
  }

  rule {

    api_groups = [
      "*"
    ]

    resources = [
      "*"
    ]

    verbs = [
      "get",
      "list",
      "watch"
    ]
  }
}

# Read Only Binding
resource "kubernetes_cluster_role_binding" "readonly" {

  metadata {

    name = "readonly-binding"
  }

  role_ref {

    api_group = "rbac.authorization.k8s.io"

    kind = "ClusterRole"

    name = kubernetes_cluster_role.readonly.metadata[0].name
  }

  subject {

    kind = "Group"

    name = "developers"

    api_group = "rbac.authorization.k8s.io"
  }
}

