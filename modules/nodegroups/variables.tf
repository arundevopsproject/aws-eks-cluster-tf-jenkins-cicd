variable "cluster_name" {

  type        = string
  description = "EKS Cluster Name"
}

variable "cluster_version" {

  type        = string
  description = "Kubernetes Version"
}

variable "environment" {

  type        = string
  description = "Environment"
}

variable "nodegroup_role_arn" {

  type        = string
  description = "IAM Role ARN for Nodegroup"
}

variable "private_subnet_ids" {

  type        = list(string)
  description = "Private Subnet IDs"
}

variable "instance_types" {

  type        = list(string)

  default = [
    "t3.large"
  ]
}

variable "capacity_type" {

  type    = string
  default = "ON_DEMAND"
}

variable "desired_size" {

  type    = number
  default = 2
}

variable "min_size" {

  type    = number
  default = 2
}

variable "max_size" {

  type    = number
  default = 6
}

variable "disk_size" {

  type    = number
  default = 100
}

variable "ami_type" {

  type    = string
  default = "AL2_x86_64"
}

variable "ssh_key_name" {

  type        = string
  description = "SSH Key Pair"
  default     = ""
}

variable "enable_spot" {

  type    = bool
  default = false
}

