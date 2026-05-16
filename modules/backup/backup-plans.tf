# Backup Retention ConfigMap
resource "kubernetes_config_map_v1" "backup_policy" {

  metadata {

    name = "backup-policy"

    namespace = kubernetes_namespace.velero.metadata[0].name
  }

  data = {

    retention = "30d"

    backup_frequency = "daily"
  }
}

