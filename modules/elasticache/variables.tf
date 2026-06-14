variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "cluster_id" {
  description = "Cluster ID"
  type        = string
}

variable "engine" {
  description = "Cache engine"
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "Node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
  default     = 1
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = null
}

variable "port" {
  description = "Port"
  type        = number
  default     = 6379
}

variable "create_subnet_group" {
  description = "Create subnet group"
  type        = bool
  default     = true
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
  default     = []
}

variable "subnet_group_name" {
  description = "Subnet group name"
  type        = string
  default     = null
}

variable "allowed_security_groups" {
  description = "Allowed security groups"
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks"
  type        = list(string)
  default     = []
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
  default     = false
}

variable "at_rest_encryption_enabled" {
  description = "Enable at-rest encryption"
  type        = bool
  default     = false
}

variable "transit_encryption_enabled" {
  description = "Enable transit encryption"
  type        = bool
  default     = false
}

variable "notification_topic_arn" {
  description = "SNS topic ARN for notifications"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
