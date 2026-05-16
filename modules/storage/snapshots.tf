# VolumeSnapshotClass
resource "kubernetes_manifest" "volume_snapshot_class" {

  manifest = {

    apiVersion = "snapshot.storage.k8s.io/v1"

    kind = "VolumeSnapshotClass"

    metadata = {

      name = "ebs-snapshot-class"
    }

    driver = "ebs.csi.aws.com"

    deletionPolicy = "Delete"
  }
}

