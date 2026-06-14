variable "image_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "Key name"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM instance profile"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "Security groups"
  type        = list(string)
  default     = []
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 30
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}

variable "enable_encryption" {
  description = "Enable encryption"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = null
}

variable "min_size" {
  description = "Minimum size"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size"
  type        = number
  default     = 5
}

variable "desired_capacity" {
  description = "Desired capacity"
  type        = number
  default     = 2
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "target_group_arns" {
  description = "Target group ARNs"
  type        = list(string)
  default     = []
}

variable "health_check_type" {
  description = "Health check type"
  type        = string
  default     = "EC2"
}

variable "health_check_grace_period" {
  description = "Health check grace period"
  type        = number
  default     = 300
}

variable "scale_up_adjustment" {
  description = "Scale up adjustment"
  type        = number
  default     = 1
}

variable "scale_down_adjustment" {
  description = "Scale down adjustment"
  type        = number
  default     = -1
}

variable "cooldown" {
  description = "Cooldown period"
  type        = number
  default     = 300
}

variable "cpu_high_threshold" {
  description = "CPU high threshold"
  type        = number
  default     = 70
}

variable "cpu_low_threshold" {
  description = "CPU low threshold"
  type        = number
  default     = 30
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
