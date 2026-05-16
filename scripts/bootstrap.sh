#!/bin/bash

set -euo pipefail

echo "========================================="
echo "BOOTSTRAPPING TERRAFORM EKS PLATFORM"
echo "========================================="

AWS_REGION="ap-south-1"
ENVIRONMENT="prod"

echo "Checking AWS Credentials..."

aws sts get-caller-identity

echo "Checking Terraform Version..."

terraform version

echo "Initializing Terraform..."

terraform init \
  -backend-config=environments/${ENVIRONMENT}/backend.tfvars

echo "Terraform Bootstrap Completed Successfully"
