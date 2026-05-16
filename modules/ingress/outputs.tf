# ACM ARN
output "acm_certificate_arn" {

  value = aws_acm_certificate.this.arn
}

# External DNS Namespace
output "external_dns_namespace" {

  value = kubernetes_namespace.external_dns.metadata[0].name
}

# ALB Controller Namespace
output "alb_controller_namespace" {

  value = kubernetes_namespace.alb_controller.metadata[0].name
}

# Cert Manager Namespace
output "cert_manager_namespace" {

  value = kubernetes_namespace.cert_manager.metadata[0].name
}

