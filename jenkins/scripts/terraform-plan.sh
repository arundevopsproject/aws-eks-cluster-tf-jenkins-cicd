#!/bin/bash

terraform init

terraform plan \
  -var-file=environments/prod/terraform.tfvars \
  -out=tfplan

  