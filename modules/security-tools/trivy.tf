# Trivy Namespace
resource "kubernetes_namespace" "trivy" {

  metadata {

    name = "trivy-system"
  }
}

# Trivy Operator
resource "helm_release" "trivy" {

  name = "trivy-operator"

  repository = "https://aquasecurity.github.io/helm-charts"

  chart = "trivy-operator"

  namespace = kubernetes_namespace.trivy.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      operator = {

        vulnerabilityScannerEnabled = true
      }
    })
  ]
}

