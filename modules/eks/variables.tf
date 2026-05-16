variable "cluster_name" {

  type        = string
  description = "EKS Cluster Name"
}

variable "eks_version" {

  type        = string
  description = "EKS Kubernetes Version"
}

variable "cluster_role_arn" {

  type        = string
  description = "EKS Cluster IAM Role ARN"
}

variable "private_subnet_ids" {

  type        = list(string)
  description = "Private Subnet IDs"
}

variable "kms_key_arn" {

  type        = string
  description = "KMS Key ARN"
}

variable "environment" {

  type        = string
  description = "Environment Name"
  default     = "prod"
}

variable "endpoint_private_access" {

  type    = bool
  default = true
}

variable "endpoint_public_access" {

  type    = bool
  default = false
}

variable "enabled_cluster_log_types" {

  type = list(string)

  default = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
}

