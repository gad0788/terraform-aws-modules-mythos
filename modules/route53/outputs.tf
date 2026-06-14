output "zone_id" {
  description = "Route53 zone ID"
  value       = data.aws_route53_zone.main.zone_id
}

output "zone_name_servers" {
  description = "Route53 zone name servers"
  value       = data.aws_route53_zone.main.name_servers
}

output "record_fqdns" {
  description = "FQDNs of created records"
  value       = aws_route53_record.main[*].fqdn
}

output "health_check_id" {
  description = "Health check ID"
  value       = try(aws_route53_health_check.main[0].id, null)
}
