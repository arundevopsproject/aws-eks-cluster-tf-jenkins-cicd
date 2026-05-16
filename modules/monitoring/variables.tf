variable "environment" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "grafana_admin_password" {

  type      = string
  sensitive = true
}

variable "grafana_hostname" {

  type = string
}

variable "storage_class" {

  type    = string
  default = "gp3"
}
