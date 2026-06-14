resource "tls_private_key" "main" {
  count       = var.generate_key_pair ? 1 : 0
  algorithm   = "RSA"
  rsa_bits    = 4096
}

resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = var.generate_key_pair ? tls_private_key.main[0].public_key_openssh : var.public_key

  tags = merge(var.tags, {
    Name = var.key_name
  })
}

resource "local_file" "private_key" {
  count             = var.generate_key_pair && var.save_private_key ? 1 : 0
  filename          = "${var.private_key_path}/${var.key_name}.pem"
  content           = tls_private_key.main[0].private_key_pem
  file_permission   = "0600"
}
