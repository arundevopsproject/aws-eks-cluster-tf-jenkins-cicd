# Argo CD Project
resource "kubernetes_manifest" "platform_project" {

  manifest = {

    apiVersion = "argoproj.io/v1alpha1"

    kind = "AppProject"

    metadata = {

      name = "platform-project"

      namespace = kubernetes_namespace.argocd.metadata[0].name
    }

    spec = {

      description = "Enterprise platform workloads"

      sourceRepos = [
        "*"
      ]

      destinations = [

        {
          namespace = "*"

          server = "https://kubernetes.default.svc"
        }
      ]

      clusterResourceWhitelist = [

        {
          group = "*"
          kind  = "*"
        }
      ]
    }
  }
}

