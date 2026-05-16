variable "environment" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "log_retention_days" {

  type    = number
  default = 30
}

variable "cloudwatch_log_group_name" {

  type = string
}

variable "storage_class" {

  type    = string
  default = "gp3"
}
