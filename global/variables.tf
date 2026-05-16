variable "aws_region" {

  description = "AWS Region"
  type        = string
  default     = "ap-south-1"

  validation {

    condition     = length(var.aws_region) > 0
    error_message = "AWS Region cannot be empty."
  }
}

variable "aws_profile" {

  description = "AWS CLI Profile"
  type        = string
  default     = "default"
}

variable "environment" {

  description = "Environment Name"
  type        = string

  validation {

    condition = contains(
      ["dev", "qa", "staging", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, qa, staging or prod."
  }
}

variable "project_name" {

  description = "Project Name"
  type        = string
}

variable "owner" {

  description = "Owner Team"
  type        = string
  default     = "platform-team"
}

variable "cost_center" {

  description = "Cost Center"
  type        = string
  default     = "cloud-platform"
}

variable "assume_role_arn" {

  description = "Cross Account Assume Role ARN"
  type        = string
  default     = ""
}

variable "eks_cluster_endpoint" {

  description = "EKS API Endpoint"
  type        = string
  default     = ""
}

variable "eks_cluster_ca" {

  description = "EKS Cluster CA Data"
  type        = string
  default     = ""
}

variable "eks_cluster_token" {

  description = "EKS Cluster Token"
  type        = string
  sensitive   = true
  default     = ""
}
