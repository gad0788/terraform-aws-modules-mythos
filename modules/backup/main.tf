resource "aws_backup_vault" "main" {
  name        = var.vault_name
  kms_key_arn = var.kms_key_arn

  tags = merge(var.tags, {
    Name = var.vault_name
  })
}

resource "aws_backup_plan" "main" {
  name = var.plan_name

  rule {
    rule_name       = var.rule_name
    target_vault_name = aws_backup_vault.main.name
    schedule         = var.schedule
    lifecycle {
      delete_after = var.delete_after_days
    }
  }

  tags = merge(var.tags, {
    Name = var.plan_name
  })
}

resource "aws_backup_vault_policy" "main" {
  count             = var.create_vault_policy ? 1 : 0
  backup_vault_name = aws_backup_vault.main.name
  policy            = var.vault_policy
}
