variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = "OpenSearch_2.5"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.small.search"
}

variable "instance_count" {
  description = "Instance count"
  type        = number
  default     = 1
}

variable "dedicated_master_enabled" {
  description = "Enable dedicated master"
  type        = bool
  default     = false
}

variable "dedicated_master_type" {
  description = "Dedicated master type"
  type        = string
  default     = null
}

variable "dedicated_master_count" {
  description = "Dedicated master count"
  type        = number
  default     = null
}

variable "ebs_enabled" {
  description = "Enable EBS"
  type        = bool
  default     = true
}

variable "ebs_volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "ebs_volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 100
}

variable "encryption_at_rest_enabled" {
  description = "Enable encryption at rest"
  type        = bool
  default     = true
}

variable "node_to_node_encryption_enabled" {
  description = "Enable node-to-node encryption"
  type        = bool
  default     = true
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
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

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
