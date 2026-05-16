provider "aws" {

  region  = var.aws_region
  profile = var.aws_profile

  assume_role {

    role_arn     = var.assume_role_arn
    session_name = "terraform-dev-session"
  }

  default_tags {

    tags = local.common_tags
  }
}
