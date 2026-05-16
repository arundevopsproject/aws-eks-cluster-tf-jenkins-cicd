# Kyverno Namespace
output "kyverno_namespace" {

  value = kubernetes_namespace.kyverno.metadata[0].name
}

# Gatekeeper Namespace
output "gatekeeper_namespace" {

  value = kubernetes_namespace.gatekeeper.metadata[0].name
}

# Falco Namespace
output "falco_namespace" {

  value = kubernetes_namespace.falco.metadata[0].name
}

# Trivy Namespace
output "trivy_namespace" {

  value = kubernetes_namespace.trivy.metadata[0].name
}

