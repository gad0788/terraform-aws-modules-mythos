data "aws_route53_zone" "main" {
  name          = var.zone_name
  private_zone  = var.private_zone
}

resource "aws_route53_record" "main" {
  count           = length(var.records)
  zone_id         = data.aws_route53_zone.main.zone_id
  name            = var.records[count.index].name
  type            = var.records[count.index].type
  ttl             = try(var.records[count.index].ttl, 300)
  records         = var.records[count.index].records
  set_identifier  = try(var.records[count.index].set_identifier, null)

  lifecycle {
    ignore_changes = [failover_routing_policy]
  }
}

resource "aws_route53_health_check" "main" {
  count             = var.create_health_check ? 1 : 0
  type              = var.health_check_type
  ip_address        = var.health_check_ip_address
  port              = var.health_check_port
  request_interval  = var.health_check_request_interval
  failure_threshold = var.health_check_failure_threshold

  tags = merge(var.tags, {
    Name = "${var.zone_name}-health-check"
  })
}
