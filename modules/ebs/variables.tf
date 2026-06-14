variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "size" {
  description = "EBS volume size in GB"
  type        = number
}

variable "type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "iops" {
  description = "IOPS for io1/io2 volumes"
  type        = number
  default     = null
}

variable "throughput" {
  description = "Throughput for gp3 volumes in MiB/s"
  type        = number
  default     = 125
}

variable "encrypted" {
  description = "Enable EBS encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "multi_attach_enabled" {
  description = "Enable multi-attach"
  type        = bool
  default     = false
}

variable "volume_name" {
  description = "Name of the EBS volume"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID to attach volume to"
  type        = string
  default     = null
}

variable "device_name" {
  description = "Device name for attachment"
  type        = string
  default     = "/dev/sdf"
}

variable "force_detach" {
  description = "Force detachment when deleting attachment"
  type        = bool
  default     = false
}

variable "create_snapshot" {
  description = "Create EBS snapshot"
  type        = bool
  default     = false
}

variable "snapshot_description" {
  description = "Description for snapshot"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
