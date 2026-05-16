#!/bin/bash

set -euo pipefail

echo "========================================="
echo "RUNNING EKS HEALTH CHECK"
echo "========================================="

kubectl get nodes

kubectl get pods -A

kubectl top nodes

kubectl top pods -A

kubectl get events -A --sort-by=.lastTimestamp

echo "EKS Health Check Completed"
