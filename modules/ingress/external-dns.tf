# External DNS Namespace
resource "kubernetes_namespace" "external_dns" {

  metadata {

    name = "external-dns"
  }
}

# External DNS Helm Release
resource "helm_release" "external_dns" {

  name = "external-dns"

  repository = "https://kubernetes-sigs.github.io/external-dns"

  chart = "external-dns"

  namespace = kubernetes_namespace.external_dns.metadata[0].name

  timeout = 900

  values = [

    yamlencode({

      provider = "aws"

      policy = "sync"

      serviceAccount = {

        create = true

        name = "external-dns"

        annotations = {

          "eks.amazonaws.com/role-arn" = var.external_dns_irsa_arn
        }
      }
    })
  ]
}

