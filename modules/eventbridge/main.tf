resource "aws_cloudwatch_event_bus" "main" {
  count = var.create_event_bus ? 1 : 0
  name  = var.event_bus_name

  tags = merge(var.tags, {
    Name = var.event_bus_name
  })
}

resource "aws_cloudwatch_event_rule" "main" {
  count               = length(var.rules)
  name                = var.rules[count.index].name
  description         = var.rules[count.index].description
  event_bus_name      = var.create_event_bus ? aws_cloudwatch_event_bus.main[0].name : var.event_bus_name
  event_pattern       = var.rules[count.index].event_pattern
  schedule_expression = var.rules[count.index].schedule_expression

  tags = merge(var.tags, {
    Name = var.rules[count.index].name
  })
}

resource "aws_cloudwatch_event_target" "main" {
  count            = length(var.targets)
  rule             = aws_cloudwatch_event_rule.main[var.targets[count.index].rule_index].name
  event_bus_name   = var.create_event_bus ? aws_cloudwatch_event_bus.main[0].name : var.event_bus_name
  target_id        = var.targets[count.index].target_id
  arn              = var.targets[count.index].arn
  role_arn         = var.targets[count.index].role_arn
  input            = try(var.targets[count.index].input, null)
}
