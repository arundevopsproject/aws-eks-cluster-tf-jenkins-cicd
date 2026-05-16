terraform {

  backend "s3" {

    bucket       = "company-prod-terraform-state"
    key          = "eks/prod/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true

    # Optional:
    # dynamodb_table = "terraform-lock-table"

    # Optional:
    # kms_key_id = "arn:aws:kms:ap-south-1:xxxxxxxx:key/xxxxx"
  }
}