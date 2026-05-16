#!/bin/bash

set -euo pipefail

echo "========================================="
echo "DESTROYING INFRASTRUCTURE"
echo "========================================="

read -p "Are you sure you want to destroy infrastructure? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then

  echo "Destroy cancelled."

  exit 1
fi

terraform destroy \
  -var-file=environments/prod/terraform.tfvars \
  -auto-approve

echo "Infrastructure Destroyed Successfully"
