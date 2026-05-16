terraform {

  backend "s3" {

    bucket       = "company-dev-terraform-state"
    key          = "eks/dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true

    # Optional:
    # dynamodb_table = "terraform-lock-table-dev"

    workspace_key_prefix = "dev"
  }
}