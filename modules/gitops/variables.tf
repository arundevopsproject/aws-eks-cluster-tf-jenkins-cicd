variable "environment" {

  type = string
}

variable "cluster_name" {

  type = string
}

variable "argocd_hostname" {

  type = string
}

variable "git_repository_url" {

  type = string
}

variable "git_repository_branch" {

  type    = string
  default = "main"
}

variable "git_username" {

  type = string
}

variable "git_token" {

  type      = string
  sensitive = true
}
