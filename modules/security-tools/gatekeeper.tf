# Gatekeeper Namespace
resource "kubernetes_namespace" "gatekeeper" {

  metadata {

    name = "gatekeeper-system"
  }
}

# Gatekeeper Helm Release
resource "helm_release" "gatekeeper" {

  name = "gatekeeper"

  repository = "https://open-policy-agent.github.io/gatekeeper/charts"

  chart = "gatekeeper"

  namespace = kubernetes_namespace.gatekeeper.metadata[0].name

  timeout = 1200
}

