variable "compute_environment_type" {
  description = "Compute environment type"
  type        = string
  default     = "MANAGED"
}

variable "state" {
  description = "State of compute environment"
  type        = string
  default     = "ENABLED"
}

variable "compute_resource_type" {
  description = "Compute resource type"
  type        = string
  default     = "EC2"
}

variable "max_vcpus" {
  description = "Maximum vCPUs"
  type        = number
  default     = 10
}

variable "min_vcpus" {
  description = "Minimum vCPUs"
  type        = number
  default     = 0
}

variable "desired_vcpus" {
  description = "Desired vCPUs"
  type        = number
  default     = 2
}

variable "instance_types" {
  description = "Instance types"
  type        = list(string)
  default     = ["optimal"]
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "job_queue_priority" {
  description = "Job queue priority"
  type        = number
  default     = 1
}

variable "job_definition_type" {
  description = "Job definition type"
  type        = string
  default     = "container"
}

variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "vcpus" {
  description = "vCPUs for job"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB for job"
  type        = number
  default     = 1024
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
