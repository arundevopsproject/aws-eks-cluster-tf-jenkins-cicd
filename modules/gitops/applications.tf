# Platform Application
resource "kubernetes_manifest" "platform_application" {

  manifest = {

    apiVersion = "argoproj.io/v1alpha1"

    kind = "Application"

    metadata = {

      name = "platform-app"

      namespace = kubernetes_namespace.argocd.metadata[0].name
    }

    spec = {

      project = "platform-project"

      source = {

        repoURL = var.git_repository_url

        targetRevision = var.git_repository_branch

        path = "k8s/platform"
      }

      destination = {

        server = "https://kubernetes.default.svc"

        namespace = "default"
      }

      syncPolicy = {

        automated = {

          prune = true

          selfHeal = true
        }

        syncOptions = [

          "CreateNamespace=true"
        ]
      }
    }
  }
}

