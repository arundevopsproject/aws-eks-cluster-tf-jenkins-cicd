# Argo CD Namespace
resource "kubernetes_namespace" "argocd" {

  metadata {

    name = "argocd"

    labels = local.common_labels
  }
}

# Argo CD Helm Release
resource "helm_release" "argocd" {

  name = "argo-cd"

  repository = "https://argoproj.github.io/argo-helm"

  chart = "argo-cd"

  namespace = kubernetes_namespace.argocd.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      server = {

        ingress = {

          enabled = true

          ingressClassName = "alb"

          hosts = [
            var.argocd_hostname
          ]

          annotations = {

            "alb.ingress.kubernetes.io/scheme" = "internet-facing"

            "alb.ingress.kubernetes.io/target-type" = "ip"
          }
        }
      }

      configs = {

        params = {

          "server.insecure" = true
        }
      }
    })
  ]
}


