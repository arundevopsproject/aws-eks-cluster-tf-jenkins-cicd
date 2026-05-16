variable "environment" {

  type        = string
  description = "Environment Name"
}

variable "vpc_id" {

  type        = string
  description = "VPC ID"
}

variable "public_subnet_id" {

  type        = string
  description = "Public Subnet ID"
}

variable "allowed_ssh_cidr" {

  type        = list(string)

  description = "Allowed SSH CIDR"

  default = [
    "0.0.0.0/0"
  ]
}

variable "instance_type" {

  type    = string
  default = "t3.micro"
}

variable "ami_id" {

  type        = string
  description = "AMI ID"
}

variable "key_name" {

  type        = string
  description = "SSH Key Pair"
  default     = ""
}

variable "associate_public_ip" {

  type    = bool
  default = true
}
