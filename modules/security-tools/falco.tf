# Falco Namespace
resource "kubernetes_namespace" "falco" {

  metadata {

    name = "falco"
  }
}

# Falco Helm Release
resource "helm_release" "falco" {

  name = "falco"

  repository = "https://falcosecurity.github.io/charts"

  chart = "falco"

  namespace = kubernetes_namespace.falco.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      falco = {

        jsonOutput = true

        grpc = {

          enabled = true
        }
      }
    })
  ]
}

