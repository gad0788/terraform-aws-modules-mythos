resource "aws_sfn_state_machine" "main" {
  name       = var.state_machine_name
  role_arn   = aws_iam_role.sfn.arn
  definition = var.definition

  tags = merge(var.tags, {
    Name = var.state_machine_name
  })
}

data "aws_iam_policy_document" "sfn_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["states.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "sfn" {
  name               = "${var.state_machine_name}-role"
  assume_role_policy = data.aws_iam_policy_document.sfn_assume_role.json
}

resource "aws_iam_role_policy" "sfn" {
  count  = var.create_policy ? 1 : 0
  name   = "${var.state_machine_name}-policy"
  role   = aws_iam_role.sfn.id
  policy = var.policy
}
