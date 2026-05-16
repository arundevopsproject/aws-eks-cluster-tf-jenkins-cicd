provider "aws" {

  region = var.aws_region

  profile = var.aws_profile

  assume_role {

    role_arn     = var.assume_role_arn
    session_name = "terraform-session"
  }

  default_tags {

    tags = local.common_tags
  }
}

provider "kubernetes" {

  host                   = var.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(var.eks_cluster_ca)
  token                  = var.eks_cluster_token
}

provider "helm" {

  kubernetes {

    host                   = var.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.eks_cluster_ca)
    token                  = var.eks_cluster_token
  }
}


