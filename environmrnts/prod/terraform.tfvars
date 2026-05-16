aws_region = "ap-south-1"

aws_profile = "production"

assume_role_arn = "arn:aws:iam::111111111111:role/TerraformAdminRole"

environment = "prod"

project_name = "enterprise-platform"

cluster_name = "enterprise-platform-prod-eks"

eks_version = "1.30"

vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

