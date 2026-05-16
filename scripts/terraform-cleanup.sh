#!/bin/bash

set -euo pipefail

echo "========================================="
echo "CLEANING TERRAFORM ARTIFACTS"
echo "========================================="

rm -rf .terraform

rm -f terraform.tfstate*

rm -f tfplan

rm -f .terraform.lock.hcl

echo "Cleanup Completed"
