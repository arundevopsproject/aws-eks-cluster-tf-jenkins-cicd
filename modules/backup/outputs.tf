# Velero Namespace
output "velero_namespace" {

  value = kubernetes_namespace.velero.metadata[0].name
}

# Backup Bucket
output "backup_bucket_name" {

  value = aws_s3_bucket.velero.bucket
}

# Velero Release
output "velero_release_name" {

  value = helm_release.velero.name
}


