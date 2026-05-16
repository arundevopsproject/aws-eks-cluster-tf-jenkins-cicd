# Namespace
resource "kubernetes_namespace" "cert_manager" {

  metadata {

    name = "cert-manager"
  }
}

# Helm Release
resource "helm_release" "cert_manager" {

  name = "cert-manager"

  repository = "https://charts.jetstack.io"

  chart = "cert-manager"

  namespace = kubernetes_namespace.cert_manager.metadata[0].name

  timeout = 900

  values = [

    yamlencode({

      installCRDs = true
    })
  ]
}

