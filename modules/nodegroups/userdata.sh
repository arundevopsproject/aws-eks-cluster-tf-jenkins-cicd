#!/bin/bash

set -ex

/etc/eks/bootstrap.sh ${cluster_name}

yum update -y

yum install -y amazon-cloudwatch-agent

sysctl -w vm.max_map_count=262144

echo "Node bootstrap completed"
