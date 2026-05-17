data "aws_eks_cluster" "eks" {

  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks" {

  name = var.cluster_name
}

provider "kubernetes" {

  host = data.aws_eks_cluster.eks.endpoint

  cluster_ca_certificate = base64decode(
    data.aws_eks_cluster.eks.certificate_authority[0].data
  )

  exec {

    api_version = "client.authentication.k8s.io/v1"

    command = "aws"

    args = [
      "eks",
      "get-token",
      "--cluster-name",
      var.cluster_name,
      "--region",
      var.aws_region
    ]
  }
}

provider "helm" {

  kubernetes {

    host = data.aws_eks_cluster.eks.endpoint

    cluster_ca_certificate = base64decode(
      data.aws_eks_cluster.eks.certificate_authority[0].data
    )

    exec {

      api_version = "client.authentication.k8s.io/v1"

      command = "aws"

      args = [
        "eks",
        "get-token",
        "--cluster-name",
        var.cluster_name,
        "--region",
        var.aws_region
      ]
    }
  }
}

