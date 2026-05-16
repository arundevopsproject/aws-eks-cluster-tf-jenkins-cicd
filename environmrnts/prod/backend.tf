terraform {

  backend "s3" {

    bucket         = "company-prod-terraform-state"
    key            = "eks/prod/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true

    # Optional enterprise locking
    # dynamodb_table = "terraform-lock-table"

    # Optional KMS encryption
    # kms_key_id = "arn:aws:kms:ap-south-1:111111111:key/xxxx"

    workspace_key_prefix = "prod"
  }
}
