resource "aws_ebs_volume" "main" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  iops              = var.type == "io1" || var.type == "io2" ? var.iops : null
  throughput        = var.type == "gp3" ? var.throughput : null
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id
  multi_attach_enabled = var.multi_attach_enabled

  tags = merge(var.tags, {
    Name = var.volume_name
  })
}

resource "aws_volume_attachment" "main" {
  count           = var.instance_id != null ? 1 : 0
  device_name     = var.device_name
  volume_id       = aws_ebs_volume.main.id
  instance_id     = var.instance_id
  force_detach    = var.force_detach
}

resource "aws_ebs_snapshot" "main" {
  count             = var.create_snapshot ? 1 : 0
  volume_id         = aws_ebs_volume.main.id
  description       = var.snapshot_description

  tags = merge(var.tags, {
    Name = "${var.volume_name}-snapshot"
  })
}
