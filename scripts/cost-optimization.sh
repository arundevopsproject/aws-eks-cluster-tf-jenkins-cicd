#!/bin/bash

set -euo pipefail

echo "========================================="
echo "RUNNING COST OPTIMIZATION CHECKS"
echo "========================================="

echo "Checking Unused EBS Volumes..."

aws ec2 describe-volumes \
  --filters Name=status,Values=available

echo "Checking Idle Load Balancers..."

aws elbv2 describe-load-balancers

echo "Checking Old EBS Snapshots..."

aws ec2 describe-snapshots \
  --owner-ids self

echo "Cost Optimization Checks Completed"
