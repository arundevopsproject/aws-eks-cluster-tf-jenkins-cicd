# KMS Key ARN
output "kms_key_arn" {

  value = aws_kms_key.secrets.arn
}

# Secrets Manager Secret ARN
output "database_secret_arn" {

  value = aws_secretsmanager_secret.database.arn
}

# SSM Parameter Name
output "ssm_parameter_name" {

  value = aws_ssm_parameter.app_config.name
}

# External Secrets Namespace
output "external_secrets_namespace" {

  value = kubernetes_namespace.external_secrets.metadata[0].name
}

