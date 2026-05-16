# Application Config Parameter
resource "aws_ssm_parameter" "app_config" {

  name = "/${var.environment}/app/config"

  type = "SecureString"

  value = "production-config"

  key_id = aws_kms_key.secrets.arn

  tags = local.common_tags
}

