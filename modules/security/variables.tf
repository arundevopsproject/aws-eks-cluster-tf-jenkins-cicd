variable "vpc_id" {

  type        = string
  description = "VPC ID"
}

variable "vpc_cidr" {

  type        = string
  description = "VPC CIDR"
}

variable "environment" {

  type        = string
  description = "Environment"
  default     = "prod"
}

variable "enable_guardduty" {

  type    = bool
  default = true
}

variable "enable_securityhub" {

  type    = bool
  default = true
}

variable "enable_inspector" {

  type    = bool
  default = true
}

variable "enable_cloudtrail" {

  type    = bool
  default = true
}

variable "enable_config" {

  type    = bool
  default = true
}

