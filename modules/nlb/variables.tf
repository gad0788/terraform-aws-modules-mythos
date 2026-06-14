variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for NLB"
  type        = list(string)
}

variable "load_balancer_name" {
  description = "Name of load balancer"
  type        = string
}

variable "internal" {
  description = "Internal load balancer"
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  type        = bool
  default     = true
}

variable "target_group_name" {
  description = "Name of target group"
  type        = string
}

variable "target_port" {
  description = "Target port"
  type        = number
  default     = 80
}

variable "listener_port" {
  description = "Listener port"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocol (TCP, TLS, UDP, TCP_UDP)"
  type        = string
  default     = "TCP"
}

variable "target_instance_ids" {
  description = "Instance IDs to attach to target group"
  type        = list(string)
  default     = []
}

variable "health_check_healthy_threshold" {
  description = "Health check healthy threshold"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Health check unhealthy threshold"
  type        = number
  default     = 3
}

variable "health_check_timeout" {
  description = "Health check timeout"
  type        = number
  default     = 10
}

variable "health_check_interval" {
  description = "Health check interval"
  type        = number
  default     = 30
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
  default     = "TCP"
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
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
