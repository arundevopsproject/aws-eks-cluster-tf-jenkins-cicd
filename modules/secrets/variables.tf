variable "environment" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "external_secrets_irsa_role_arn" {

  type = string
}

variable "region" {

  type    = string
  default = "ap-south-1"
}
