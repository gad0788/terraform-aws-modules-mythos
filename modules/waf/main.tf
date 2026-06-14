resource "aws_wafv2_ip_set" "main" {
  count              = var.create_ip_set ? 1 : 0
  name               = "${var.environment}-ip-set"
  scope              = var.scope
  ip_address_version = "IPV4"
  addresses          = var.ip_addresses

  tags = merge(var.tags, {
    Name = "${var.environment}-ip-set"
  })
}

resource "aws_wafv2_web_acl" "main" {
  name  = "${var.environment}-waf"
  scope = var.scope

  default_action {
    allow {}
  }

  dynamic "rule" {
    for_each = var.rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        block {}
      }

      statement {
        rate_based_statement {
          limit              = rule.value.rate_limit
          aggregate_key_type = "IP"
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.environment}-waf"
    sampled_requests_enabled   = true
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-waf"
  })
}

resource "aws_wafv2_web_acl_association" "main" {
  count        = var.resource_arn != null ? 1 : 0
  resource_arn = var.resource_arn
  web_acl_arn  = aws_wafv2_web_acl.main.arn
}
