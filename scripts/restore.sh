#!/bin/bash

set -euo pipefail

BACKUP_NAME=$1

if [[ -z "${BACKUP_NAME}" ]]; then

  echo "Usage: ./restore.sh <backup-name>"

  exit 1
fi

echo "========================================="
echo "RESTORING EKS BACKUP"
echo "========================================="

velero restore create \
  --from-backup ${BACKUP_NAME}

echo "Restore Triggered Successfully"
