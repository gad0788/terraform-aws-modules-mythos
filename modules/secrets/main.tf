resource "aws_secretsmanager_secret" "main" {
  name                    = var.secret_name
  description             = var.description
  recovery_window_in_days = var.recovery_window_in_days
  kms_key_id              = var.kms_key_id

  tags = merge(var.tags, {
    Name = var.secret_name
  })
}

resource "aws_secretsmanager_secret_version" "main" {
  count             = var.secret_string != null || var.secret_json != null ? 1 : 0
  secret_id         = aws_secretsmanager_secret.main.id
  secret_string     = var.secret_string != null ? var.secret_string : jsonencode(var.secret_json)
}

resource "aws_secretsmanager_secret_rotation" "main" {
  count               = var.enable_rotation ? 1 : 0
  secret_id           = aws_secretsmanager_secret.main.id
  rotation_rules {
    automatically_after_days = var.rotation_days
  }
  rotation_lambda_arn = var.rotation_lambda_arn
}
