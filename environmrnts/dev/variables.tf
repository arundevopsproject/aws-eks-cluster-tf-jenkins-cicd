variable "aws_region" {

  type        = string
  description = "AWS Region"
}

variable "aws_profile" {

  type        = string
  description = "AWS Profile"
}

variable "assume_role_arn" {

  type        = string
  description = "Cross Account Role ARN"
}

variable "environment" {

  type        = string
  description = "Environment Name"
}

variable "project_name" {

  type        = string
  description = "Project Name"
}

variable "vpc_cidr" {

  type        = string
  description = "VPC CIDR"
}

variable "public_subnets" {

  type        = list(string)
  description = "Public Subnets"
}

variable "private_subnets" {

  type        = list(string)
  description = "Private Subnets"
}

variable "availability_zones" {

  type        = list(string)
  description = "Availability Zones"
}

variable "eks_version" {

  type        = string
  description = "EKS Version"
}

variable "cluster_name" {

  type        = string
  description = "Cluster Name"
}
