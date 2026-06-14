resource "aws_security_group" "efs" {
  name        = "${var.environment}-efs-sg"
  description = "Security group for EFS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
    cidr_blocks     = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-efs-sg"
  })
}

resource "aws_efs_file_system" "main" {
  performance_mode                = var.performance_mode
  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id

  tags = merge(var.tags, {
    Name = "${var.environment}-efs"
  })
}

resource "aws_efs_mount_target" "main" {
  count           = length(var.subnet_ids)
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = [aws_security_group.efs.id]
}

resource "aws_efs_access_point" "main" {
  count          = var.create_access_point ? 1 : 0
  file_system_id = aws_efs_file_system.main.id

  root_directory {
    path = var.access_point_path
  }

  posix_user {
    gid = var.posix_gid
    uid = var.posix_uid
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-efs-access-point"
  })
}

resource "aws_efs_backup_policy" "main" {
  count          = var.enable_backup_policy ? 1 : 0
  file_system_id = aws_efs_file_system.main.id

  backup_policy {
    status = "ENABLED"
  }
}
