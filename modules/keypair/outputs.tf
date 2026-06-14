output "key_name" {
  description = "Key pair name"
  value       = aws_key_pair.main.key_name
}

output "public_key" {
  description = "Public key"
  value       = aws_key_pair.main.public_key
}

output "private_key" {
  description = "Private key (if generated)"
  value       = try(tls_private_key.main[0].private_key_pem, null)
  sensitive   = true
}

output "private_key_path" {
  description = "Path to private key file"
  value       = try(local_file.private_key[0].filename, null)
}
