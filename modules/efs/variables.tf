variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for EFS mount targets"
  type        = list(string)
}

variable "performance_mode" {
  description = "Performance mode"
  type        = string
  default     = "generalPurpose"
  validation {
    condition     = contains(["generalPurpose", "maxIO"], var.performance_mode)
    error_message = "Performance mode must be generalPurpose or maxIO"
  }
}

variable "throughput_mode" {
  description = "Throughput mode"
  type        = string
  default     = "bursting"
  validation {
    condition     = contains(["bursting", "provisioned"], var.throughput_mode)
    error_message = "Throughput mode must be bursting or provisioned"
  }
}

variable "provisioned_throughput_in_mibps" {
  description = "Provisioned throughput in MiB/s"
  type        = number
  default     = 1
}

variable "encrypted" {
  description = "Enable encryption at rest"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "allowed_security_groups" {
  description = "Security groups allowed to mount EFS"
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to mount EFS"
  type        = list(string)
  default     = []
}

variable "create_access_point" {
  description = "Create EFS access point"
  type        = bool
  default     = false
}

variable "access_point_path" {
  description = "Path for EFS access point"
  type        = string
  default     = "/"
}

variable "posix_uid" {
  description = "POSIX user ID"
  type        = number
  default     = 0
}

variable "posix_gid" {
  description = "POSIX group ID"
  type        = number
  default     = 0
}

variable "enable_backup_policy" {
  description = "Enable EFS backup policy"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
