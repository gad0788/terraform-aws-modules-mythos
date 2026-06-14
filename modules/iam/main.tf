resource "aws_iam_role" "main" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.assume_role_policy_principals
        }
      }
    ]
  })

  tags = merge(var.tags, {
    Name = var.role_name
  })
}

resource "aws_iam_role_policy" "inline_policies" {
  for_each = var.inline_policies

  name = each.key
  role = aws_iam_role.main.id

  policy = each.value
}

resource "aws_iam_role_policy_attachment" "managed_policies" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.main.name
  policy_arn = each.value
}

resource "aws_iam_user" "main" {
  count = var.create_user ? 1 : 0
  name  = var.user_name

  tags = merge(var.tags, {
    Name = var.user_name
  })
}

resource "aws_iam_user_policy" "main" {
  count = var.create_user ? 1 : 0
  name  = "${var.user_name}-policy"
  user  = aws_iam_user.main[0].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = var.user_statements
  })
}

resource "aws_iam_user_policy_attachment" "main" {
  for_each = var.create_user ? toset(var.user_managed_policy_arns) : toset([])

  user       = aws_iam_user.main[0].name
  policy_arn = each.value
}

resource "aws_iam_group" "main" {
  count = var.create_group ? 1 : 0
  name  = var.group_name
}

resource "aws_iam_group_policy" "main" {
  count   = var.create_group ? 1 : 0
  name    = "${var.group_name}-policy"
  group   = aws_iam_group.main[0].name
  policy  = jsonencode({
    Version = "2012-10-17"
    Statement = var.group_statements
  })
}

resource "aws_iam_group_policy_attachment" "main" {
  for_each = var.create_group ? toset(var.group_managed_policy_arns) : toset([])

  group      = aws_iam_group.main[0].name
  policy_arn = each.value
}

resource "aws_iam_policy" "main" {
  count       = var.create_policy ? 1 : 0
  name        = var.policy_name
  description = var.policy_description

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = var.policy_statements
  })

  tags = merge(var.tags, {
    Name = var.policy_name
  })
}

resource "aws_iam_instance_profile" "main" {
  count = var.create_instance_profile ? 1 : 0
  name  = "${var.role_name}-instance-profile"
  role  = aws_iam_role.main.name
}
