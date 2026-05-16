# AWS Backup Vault
resource "aws_backup_vault" "this" {

  name = "${var.environment}-eks-backup-vault"

  tags = {

    Environment = var.environment
  }
}

# AWS Backup Plan
resource "aws_backup_plan" "this" {

  name = "${var.environment}-eks-backup-plan"

  rule {

    rule_name = "daily-backup"

    target_vault_name = aws_backup_vault.this.name

    schedule = "cron(0 2 * * ? *)"

    lifecycle {

      delete_after = 30
    }
  }
}

