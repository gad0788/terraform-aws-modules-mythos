variable "create_s3_location" {
  description = "Create S3 location"
  type        = bool
  default     = false
}

variable "s3_location_name" {
  description = "S3 location name"
  type        = string
  default     = null
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN"
  type        = string
  default     = null
}

variable "create_efs_location" {
  description = "Create EFS location"
  type        = bool
  default     = false
}

variable "efs_location_name" {
  description = "EFS location name"
  type        = string
  default     = null
}

variable "efs_file_system_arn" {
  description = "EFS file system ARN"
  type        = string
  default     = null
}

variable "subdirectory" {
  description = "Subdirectory"
  type        = string
  default     = "/"
}

variable "bucket_access_role_arn" {
  description = "S3 bucket access role ARN"
  type        = string
  default     = null
}

variable "security_group_arns" {
  description = "Security group ARNs"
  type        = list(string)
  default     = []
}

variable "subnet_arn" {
  description = "Subnet ARN"
  type        = string
  default     = null
}

variable "create_task" {
  description = "Create DataSync task"
  type        = bool
  default     = false
}

variable "task_name" {
  description = "Task name"
  type        = string
  default     = null
}

variable "source_location_arn" {
  description = "Source location ARN"
  type        = string
  default     = null
}

variable "destination_location_arn" {
  description = "Destination location ARN"
  type        = string
  default     = null
}

variable "verify_mode" {
  description = "Verify mode"
  type        = string
  default     = "POINT_IN_TIME_CONSISTENT"
}

variable "atime" {
  description = "Atime"
  type        = string
  default     = "BEST_EFFORT"
}

variable "mtime" {
  description = "Mtime"
  type        = string
  default     = "PRESERVE"
}

variable "preserve_deleted_files" {
  description = "Preserve deleted files"
  type        = string
  default     = "PRESERVE"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
