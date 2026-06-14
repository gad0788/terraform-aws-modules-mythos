output "cluster_id" {
  description = "Cluster ID"
  value       = aws_elasticache_cluster.main.id
}

output "cluster_address" {
  description = "Cluster address"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "cluster_port" {
  description = "Cluster port"
  value       = aws_elasticache_cluster.main.port
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.elasticache.id
}
