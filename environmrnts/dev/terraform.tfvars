aws_region = "ap-south-1"

aws_profile = "development"

assume_role_arn = "arn:aws:iam::111111111111:role/TerraformDevRole"

environment = "dev"

project_name = "enterprise-platform"

cluster_name = "enterprise-platform-dev-eks"

eks_version = "1.30"

vpc_cidr = "10.10.0.0/16"

public_subnets = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_subnets = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]
