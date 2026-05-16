# EFS File System ID
output "efs_file_system_id" {

  value = aws_efs_file_system.this.id
}

# EFS DNS Name
output "efs_dns_name" {

  value = aws_efs_file_system.this.dns_name
}

# Backup Vault ARN
output "backup_vault_arn" {

  value = aws_backup_vault.this.arn
}

# gp3 StorageClass
output "gp3_storageclass_name" {

  value = kubernetes_storage_class_v1.gp3.metadata[0].name
}

# EFS StorageClass
output "efs_storageclass_name" {

  value = kubernetes_storage_class_v1.efs.metadata[0].name
}
