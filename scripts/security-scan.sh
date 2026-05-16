#!/bin/bash

set -euo pipefail

echo "========================================="
echo "RUNNING DEVSECOPS SECURITY SCANS"
echo "========================================="

echo "Running tfsec..."

tfsec .

echo "Running Checkov..."

checkov -d .

echo "Running Terrascan..."

terrascan scan

echo "Running KICS..."

kics scan -p .

echo "Running Trivy Filesystem Scan..."

trivy fs .

echo "Running kube-score..."

kube-score score k8s/*.yaml

echo "Security Scan Completed Successfully"
