variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "assume_role_policy_principals" {
  description = "Principals that can assume the role"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "Inline policies for the role"
  type        = map(string)
  default     = {}
}

variable "managed_policy_arns" {
  description = "ARNs of managed policies to attach to role"
  type        = list(string)
  default     = []
}

variable "create_user" {
  description = "Create IAM user"
  type        = bool
  default     = false
}

variable "user_name" {
  description = "IAM user name"
  type        = string
  default     = null
}

variable "user_statements" {
  description = "Statements for user policy"
  type = list(object({
    Action   = list(string)
    Effect   = string
    Resource = list(string)
  }))
  default = []
}

variable "user_managed_policy_arns" {
  description = "Managed policy ARNs for user"
  type        = list(string)
  default     = []
}

variable "create_group" {
  description = "Create IAM group"
  type        = bool
  default     = false
}

variable "group_name" {
  description = "IAM group name"
  type        = string
  default     = null
}

variable "group_statements" {
  description = "Statements for group policy"
  type = list(object({
    Action   = list(string)
    Effect   = string
    Resource = list(string)
  }))
  default = []
}

variable "group_managed_policy_arns" {
  description = "Managed policy ARNs for group"
  type        = list(string)
  default     = []
}

variable "create_policy" {
  description = "Create IAM policy"
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "Policy name"
  type        = string
  default     = null
}

variable "policy_description" {
  description = "Policy description"
  type        = string
  default     = null
}

variable "policy_statements" {
  description = "Statements for policy"
  type = list(object({
    Action   = list(string)
    Effect   = string
    Resource = list(string)
  }))
  default = []
}

variable "create_instance_profile" {
  description = "Create instance profile"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
