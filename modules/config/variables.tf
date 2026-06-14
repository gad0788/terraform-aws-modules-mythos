variable "environment" {
  description = "Environment name"
  type        = string
}

variable "create_config_aggregator" {
  description = "Create Config aggregator"
  type        = bool
  default     = false
}

variable "aggregator_account_ids" {
  description = "Account IDs for aggregator"
  type        = list(string)
  default     = []
}

variable "aggregator_regions" {
  description = "Regions for aggregator"
  type        = list(string)
  default     = []
}

variable "config_rules" {
  description = "Config rules"
  type = list(object({
    name                        = string
    description                 = string
    source_identifier          = string
    compliance_resource_types  = list(string)
  }))
  default = []
}

variable "config_bucket_name" {
  description = "Config S3 bucket name"
  type        = string
}

variable "s3_key_prefix" {
  description = "S3 key prefix"
  type        = string
  default     = "config/"
}

variable "enable_recorder" {
  description = "Enable recorder"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
