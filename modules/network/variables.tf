variable "environment" {

  type        = string
  description = "Environment Name"
}

variable "vpc_cidr" {

  type        = string
  description = "VPC CIDR"
}

variable "public_subnets" {

  type        = list(string)
  description = "Public Subnet CIDRs"
}

variable "private_subnets" {

  type        = list(string)
  description = "Private Subnet CIDRs"
}

variable "azs" {

  type        = list(string)
  description = "Availability Zones"
}

variable "enable_nat_gateway" {

  type        = bool
  default     = true
}

variable "single_nat_gateway" {

  type        = bool
  default     = true
}

variable "enable_flow_logs" {

  type        = bool
  default     = true
}

variable "flow_log_retention_days" {

  type        = number
  default     = 30
}
