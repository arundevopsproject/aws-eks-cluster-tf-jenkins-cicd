#!/bin/bash

set -euo pipefail

SECRET_ID=$1

if [[ -z "${SECRET_ID}" ]]; then

  echo "Usage: ./rotate-secrets.sh <secret-id>"

  exit 1
fi

echo "========================================="
echo "ROTATING AWS SECRET"
echo "========================================="

aws secretsmanager rotate-secret \
  --secret-id ${SECRET_ID}

echo "Secret Rotation Triggered"
