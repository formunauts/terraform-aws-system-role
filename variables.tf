variable "namespace" {
  type        = string
  description = "Namespace (e.g. `fn` or `formunauts`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  default     = "account"
  description = "Application or solution name (e.g. `app`)"
}

variable "account_id" {
  type        = string
  default     = ""
  description = "AWS account ID from where the role can be assumed"
}

variable "role_name" {
  type        = string
  default     = ""
  description = "Name of the role"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Wheter or not to create role"
}

variable "policy_arns" {
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  description = "List of policy ARNs to be attached to the role"
}

variable "require_mfa" {
  type        = bool
  default     = true
  description = "Whether or not to require multi-factor authentication"
}
