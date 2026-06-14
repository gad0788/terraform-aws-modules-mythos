variable "state_machine_name" {
  description = "State machine name"
  type        = string
}

variable "definition" {
  description = "State machine definition JSON"
  type        = string
}

variable "create_policy" {
  description = "Create IAM policy"
  type        = bool
  default     = false
}

variable "policy" {
  description = "IAM policy JSON"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
