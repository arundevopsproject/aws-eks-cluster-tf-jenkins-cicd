#!/bin/bash

set -e

curl -LO https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip

curl -LO https://github.com/aquasecurity/tfsec/releases/latest/download/tfsec-linux-amd64

curl -LO https://github.com/bridgecrewio/checkov/releases/latest/download/checkov-linux

chmod +x tfsec-linux-amd64

chmod +x checkov-linux

