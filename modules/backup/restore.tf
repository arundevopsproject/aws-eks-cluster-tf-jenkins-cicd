# Restore Example
resource "kubernetes_manifest" "restore_example" {

  manifest = {

    apiVersion = "velero.io/v1"

    kind = "Restore"

    metadata = {

      name = "example-restore"

      namespace = kubernetes_namespace.velero.metadata[0].name
    }

    spec = {

      backupName = "daily-backup"

      includedNamespaces = [
        "*"
      ]
    }
  }
}

