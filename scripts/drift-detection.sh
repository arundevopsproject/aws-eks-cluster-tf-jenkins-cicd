#!/bin/bash

set -euo pipefail

echo "========================================="
echo "RUNNING TERRAFORM DRIFT DETECTION"
echo "========================================="

terraform plan \
  -var-file=environments/prod/terraform.tfvars \
  -detailed-exitcode

EXIT_CODE=$?

if [[ $EXIT_CODE -eq 0 ]]; then

  echo "No Drift Detected"

elif [[ $EXIT_CODE -eq 2 ]]; then

  echo "Drift Detected"

  exit 2

else

  echo "Terraform Plan Failed"

  exit 1
fi
