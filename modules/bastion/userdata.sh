#!/bin/bash

set -eux

yum update -y

yum install -y \
  git \
  unzip \
  wget \
  curl \
  jq \
  vim \
  telnet \
  bind-utils

# Install kubectl

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.30.0/2024-05-12/bin/linux/amd64/kubectl

chmod +x kubectl

mv kubectl /usr/local/bin/

# Install AWS CLI v2

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

# Install Helm

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Bastion bootstrap completed"
