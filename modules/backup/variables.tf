variable "environment" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "velero_irsa_role_arn" {

  type = string
}

variable "backup_bucket_name" {

  type = string
}

variable "region" {

  type    = string
  default = "ap-south-1"
}
