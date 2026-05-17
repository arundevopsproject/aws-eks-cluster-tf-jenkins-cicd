resource "kubernetes_namespace" "jenkins" {

  metadata {

    name = "jenkins"

    labels = {

      "pod-security.kubernetes.io/enforce" = "restricted"

      "pod-security.kubernetes.io/audit" = "restricted"

      "pod-security.kubernetes.io/warn" = "restricted"
    }
  }
}
