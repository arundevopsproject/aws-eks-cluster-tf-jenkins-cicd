variable "cluster_name" {

  type        = string
  description = "EKS Cluster Name"
}

variable "environment" {

  type        = string
  description = "Environment Name"
  default     = "prod"
}

variable "oidc_provider_arn" {

  type        = string
  description = "OIDC Provider ARN"
  default     = ""
}

variable "oidc_provider_url" {

  type        = string
  description = "OIDC Provider URL"
  default     = ""
}
