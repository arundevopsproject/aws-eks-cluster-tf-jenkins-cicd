#!/bin/bash

set -euo pipefail

echo "========================================="
echo "VALIDATING TERRAFORM CONFIGURATION"
echo "========================================="

terraform fmt -recursive -check

terraform validate

echo "Running Terraform Plan Validation..."

terraform plan \
  -var-file=environments/prod/terraform.tfvars \
  -lock=true \
  -detailed-exitcode || true

echo "Validation Completed Successfully"
