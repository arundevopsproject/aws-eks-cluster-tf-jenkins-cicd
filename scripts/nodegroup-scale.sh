#!/bin/bash

set -euo pipefail

CLUSTER_NAME=$1
NODEGROUP_NAME=$2
DESIRED_SIZE=$3

if [[ $# -ne 3 ]]; then

  echo "Usage: ./nodegroup-scale.sh <cluster> <nodegroup> <desired-size>"

  exit 1
fi

echo "========================================="
echo "SCALING EKS NODEGROUP"
echo "========================================="

aws eks update-nodegroup-config \
  --cluster-name ${CLUSTER_NAME} \
  --nodegroup-name ${NODEGROUP_NAME} \
  --scaling-config desiredSize=${DESIRED_SIZE}

echo "Nodegroup Scaling Triggered"
