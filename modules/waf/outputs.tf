output "web_acl_id" {
  description = "WAF Web ACL ID"
  value       = aws_wafv2_web_acl.main.id
}

output "web_acl_arn" {
  description = "WAF Web ACL ARN"
  value       = aws_wafv2_web_acl.main.arn
}

output "ip_set_id" {
  description = "WAF IP Set ID"
  value       = try(aws_wafv2_ip_set.main[0].id, null)
}

output "association_id" {
  description = "WAF association ID"
  value       = try(aws_wafv2_web_acl_association.main[0].id, null)
}
