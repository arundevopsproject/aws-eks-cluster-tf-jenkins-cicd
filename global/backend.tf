terraform {

  backend "s3" {

    bucket         = "prod-terraform-state-bucket"
    key            = "eks-platform/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true

    dynamodb_table = "terraform-lock-table"

    kms_key_id     = "alias/terraform-state-kms"

    use_lockfile   = true
  }
}
