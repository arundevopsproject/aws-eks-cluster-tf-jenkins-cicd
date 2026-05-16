# Daily Backup Schedule
resource "kubernetes_manifest" "daily_backup" {

  manifest = {

    apiVersion = "velero.io/v1"

    kind = "Schedule"

    metadata = {

      name = "daily-backup"

      namespace = kubernetes_namespace.velero.metadata[0].name
    }

    spec = {

      schedule = "0 2 * * *"

      template = {

        ttl = "720h"

        includedNamespaces = [
          "*"
        ]

        snapshotVolumes = true
      }
    }
  }
}

# Weekly Backup Schedule
resource "kubernetes_manifest" "weekly_backup" {

  manifest = {

    apiVersion = "velero.io/v1"

    kind = "Schedule"

    metadata = {

      name = "weekly-backup"

      namespace = kubernetes_namespace.velero.metadata[0].name
    }

    spec = {

      schedule = "0 1 * * 0"

      template = {

        ttl = "2160h"

        includedNamespaces = [
          "*"
        ]

        snapshotVolumes = true
      }
    }
  }
}

