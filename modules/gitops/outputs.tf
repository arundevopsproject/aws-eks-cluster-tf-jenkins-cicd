# Argo CD Namespace
output "argocd_namespace" {

  value = kubernetes_namespace.argocd.metadata[0].name
}

# Argo CD Helm Release
output "argocd_release_name" {

  value = helm_release.argocd.name
}

# Argo CD URL
output "argocd_url" {

  value = "https://${var.argocd_hostname}"
}

