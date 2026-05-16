# Git Repository Secret
resource "kubernetes_secret" "git_repository" {

  metadata {

    name = "git-repository"

    namespace = kubernetes_namespace.argocd.metadata[0].name

    labels = {

      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {

    url      = var.git_repository_url

    username = var.git_username

    password = var.git_token

    type     = "git"
  }

  type = "Opaque"
}

