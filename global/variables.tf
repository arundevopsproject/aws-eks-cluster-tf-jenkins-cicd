variable "aws_region" {

  type        = string
  description = "AWS Region"

  default = "ap-south-1"
}

variable "environment" {

  type        = string
  description = "Deployment Environment"
}
