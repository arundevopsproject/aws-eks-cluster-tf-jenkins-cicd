# Inspector Enablement
resource "aws_inspector2_enabler" "this" {

  count = var.enable_inspector ? 1 : 0

  account_ids = [
    data.aws_caller_identity.current.account_id
  ]

  resource_types = [
    "EC2",
    "ECR"
  ]
}

# Caller Identity
data "aws_caller_identity" "current" {}
