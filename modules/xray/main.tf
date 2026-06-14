resource "aws_xray_group" "main" {
  group_name        = var.group_name
  filter_expression = var.filter_expression

  tags = merge(var.tags, {
    Name = var.group_name
  })
}

resource "aws_xray_sampling_rule" "main" {
  count             = var.create_sampling_rule ? 1 : 0
  rule_name         = var.rule_name
  priority          = var.priority
  version           = var.rule_version
  host              = var.host
  http_method       = var.http_method
  url_path          = var.url_path
  resource_arn      = var.resource_arn
  service_name      = var.service_name
  service_type      = var.service_type
  fixed_rate        = var.fixed_rate
  reservoir_size    = var.reservoir_size

  attributes = var.attributes
}
