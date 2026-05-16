# Backup Namespace
resource "kubernetes_namespace" "velero" {

  metadata {

    name = "velero"
  }
}

# Backup Bucket
resource "aws_s3_bucket" "velero" {

  bucket = var.backup_bucket_name

  force_destroy = false

  tags = local.common_tags
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "velero" {

  bucket = aws_s3_bucket.velero.id

  versioning_configuration {

    status = "Enabled"
  }
}

# Bucket Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "velero" {

  bucket = aws_s3_bucket.velero.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"
    }
  }
}

# Velero Helm Release
resource "helm_release" "velero" {

  name = "velero"

  repository = "https://vmware-tanzu.github.io/helm-charts"

  chart = "velero"

  namespace = kubernetes_namespace.velero.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      configuration = {

        backupStorageLocation = {

          bucket = aws_s3_bucket.velero.bucket

          config = {

            region = var.region
          }
        }

        volumeSnapshotLocation = {

          config = {

            region = var.region
          }
        }
      }

      serviceAccount = {

        server = {

          create = true

          name = "velero"

          annotations = {

            "eks.amazonaws.com/role-arn" = var.velero_irsa_role_arn
          }
        }
      }

      initContainers = [

        {
          name = "velero-plugin-for-aws"

          image = "velero/velero-plugin-for-aws:v1.10.0"

          volumeMounts = [

            {
              mountPath = "/target"

              name = "plugins"
            }
          ]
        }
      ]
    })
  ]
}

