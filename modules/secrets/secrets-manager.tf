# Database Secret
resource "aws_secretsmanager_secret" "database" {

  name = "${var.environment}/database"

  kms_key_id = aws_kms_key.secrets.arn

  recovery_window_in_days = 30

  tags = local.common_tags
}

# Database Secret Version
resource "aws_secretsmanager_secret_version" "database" {

  secret_id = aws_secretsmanager_secret.database.id

  secret_string = jsonencode({

    username = "admin"

    password = "ChangeMe123!"
  })
}

