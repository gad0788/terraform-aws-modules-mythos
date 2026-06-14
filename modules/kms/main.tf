resource "aws_kms_key" "main" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation

  tags = merge(var.tags, {
    Name = var.key_name
  })
}

resource "aws_kms_alias" "main" {
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.main.key_id
}

resource "aws_kms_key_policy" "main" {
  count  = var.create_key_policy ? 1 : 0
  key_id = aws_kms_key.main.id
  policy = var.key_policy
}
