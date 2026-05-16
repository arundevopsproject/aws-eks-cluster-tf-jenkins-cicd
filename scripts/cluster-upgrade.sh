#!/bin/bash

set -euo pipefail

CLUSTER_NAME="prod-eks-cluster"

TARGET_VERSION="1.31"

echo "========================================="
echo "UPGRADING EKS CLUSTER"
echo "========================================="

aws eks update-cluster-version \
  --name ${CLUSTER_NAME} \
  --kubernetes-version ${TARGET_VERSION}

echo "Cluster Upgrade Triggered"
