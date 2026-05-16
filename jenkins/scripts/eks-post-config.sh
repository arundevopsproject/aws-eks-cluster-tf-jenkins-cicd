#!/bin/bash

aws eks update-kubeconfig \
  --region ap-south-1 \
  --name prod-eks-cluster

kubectl get nodes

kubectl get pods -A

