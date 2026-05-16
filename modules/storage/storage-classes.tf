# gp3 StorageClass
resource "kubernetes_storage_class_v1" "gp3" {

  metadata {

    name = "gp3"
  }

  storage_provisioner = "ebs.csi.aws.com"

  reclaim_policy = "Delete"

  volume_binding_mode = "WaitForFirstConsumer"

  parameters = {

    type = "gp3"

    encrypted = "true"

    fsType = "ext4"
  }
}

# EFS StorageClass
resource "kubernetes_storage_class_v1" "efs" {

  metadata {

    name = "efs-sc"
  }

  storage_provisioner = "efs.csi.aws.com"

  reclaim_policy = "Retain"

  parameters = {

    provisioningMode = "efs-ap"

    fileSystemId = aws_efs_file_system.this.id

    directoryPerms = "700"

    gidRangeStart = "1000"

    gidRangeEnd = "2000"

    basePath = "/dynamic_provisioning"
  }
}

