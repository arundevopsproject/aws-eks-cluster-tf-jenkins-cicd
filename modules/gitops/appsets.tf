# ApplicationSet
resource "kubernetes_manifest" "platform_appset" {

  manifest = {

    apiVersion = "argoproj.io/v1alpha1"

    kind = "ApplicationSet"

    metadata = {

      name = "platform-appset"

      namespace = kubernetes_namespace.argocd.metadata[0].name
    }

    spec = {

      generators = [

        {
          list = {

            elements = [

              {
                cluster = "dev"
                url = "https://kubernetes.default.svc"
              },

              {
                cluster = "prod"
                url = "https://kubernetes.default.svc"
              }
            ]
          }
        }
      ]

      template = {

        metadata = {

          name = "{{cluster}}-platform"
        }

        spec = {

          project = "platform-project"

          source = {

            repoURL = var.git_repository_url

            targetRevision = var.git_repository_branch

            path = "k8s/{{cluster}}"
          }

          destination = {

            server = "{{url}}"

            namespace = "default"
          }

          syncPolicy = {

            automated = {

              selfHeal = true

              prune = true
            }
          }
        }
      }
    }
  }
}

