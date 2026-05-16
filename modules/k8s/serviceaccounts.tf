# Default Application Service Account
resource "kubernetes_service_account_v1" "app_serviceaccount" {

  metadata {

    name = "application-sa"

    namespace = "apps"

    labels = local.common_labels
  }
}

# Monitoring Service Account
resource "kubernetes_service_account_v1" "monitoring_sa" {

  metadata {

    name = "monitoring-sa"

    namespace = "monitoring"

    labels = local.common_labels
  }
}

