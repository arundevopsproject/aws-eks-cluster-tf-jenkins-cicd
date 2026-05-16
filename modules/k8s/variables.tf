variable "environment" {

  type = string
}

variable "application_namespaces" {

  type = list(string)

  default = [
    "apps",
    "platform",
    "monitoring",
    "logging"
  ]
}

