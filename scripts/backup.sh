#!/bin/bash

set -euo pipefail

CLUSTER_NAME="prod-eks-cluster"

BACKUP_NAME="manual-backup-$(date +%Y%m%d-%H%M%S)"

echo "========================================="
echo "CREATING EKS BACKUP"
echo "========================================="

velero backup create ${BACKUP_NAME} \
  --include-namespaces '*' \
  --wait

echo "Backup Created Successfully: ${BACKUP_NAME}"
