resource "aws_datasync_location_s3" "main" {
  count           = var.create_s3_location ? 1 : 0
  s3_bucket_arn   = var.s3_bucket_arn
  subdirectory    = var.subdirectory
  s3_config {
    bucket_access_role_arn = var.bucket_access_role_arn
  }

  tags = merge(var.tags, {
    Name = var.s3_location_name
  })
}

resource "aws_datasync_location_efs" "main" {
  count          = var.create_efs_location ? 1 : 0
  efs_file_system_arn = var.efs_file_system_arn
  subdirectory   = var.subdirectory
  ec2_config {
    security_group_arns = var.security_group_arns
    subnet_arn          = var.subnet_arn
  }

  tags = merge(var.tags, {
    Name = var.efs_location_name
  })
}

resource "aws_datasync_task" "main" {
  count                    = var.create_task ? 1 : 0
  source_location_arn      = var.source_location_arn
  destination_location_arn = var.destination_location_arn
  name                     = var.task_name

  options {
    verify_mode             = var.verify_mode
    atime                   = var.atime
    mtime                   = var.mtime
    preserve_deleted_files  = var.preserve_deleted_files
  }

  tags = merge(var.tags, {
    Name = var.task_name
  })
}
