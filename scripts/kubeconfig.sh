#!/bin/bash

set -euo pipefail

CLUSTER_NAME="prod-eks-cluster"

AWS_REGION="ap-south-1"

echo "========================================="
echo "UPDATING KUBECONFIG"
echo "========================================="

aws eks update-kubeconfig \
  --name ${CLUSTER_NAME} \
  --region ${AWS_REGION}

kubectl get nodes
