# Restricted Pod Security Namespace
resource "kubernetes_namespace" "restricted_apps" {

  metadata {

    name = "restricted-apps"

    labels = {

      "pod-security.kubernetes.io/enforce" = "restricted"

      "pod-security.kubernetes.io/audit" = "restricted"

      "pod-security.kubernetes.io/warn" = "restricted"
    }
  }
}

