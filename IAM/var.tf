variable "group_user_map" {
  description = "Map of group names to users in that group"
  type        = map(list(string))
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = "IAM policy created via Terraform"
}

variable "policy_document" {
  description = "Policy JSON as string"
  type        = string
}

variable "role_names" {
  description = "List of IAM role names"
  type        = list(string)
}

variable "assume_role_policy" {
  description = "Trust policy JSON"
  type        = string
}