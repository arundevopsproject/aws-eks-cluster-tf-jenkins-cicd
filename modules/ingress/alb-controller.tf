# AWS Load Balancer Controller Namespace
resource "kubernetes_namespace" "alb_controller" {

  metadata {

    name = "aws-load-balancer-controller"
  }
}

# Helm Release
resource "helm_release" "alb_controller" {

  name = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"

  chart = "aws-load-balancer-controller"

  namespace = kubernetes_namespace.alb_controller.metadata[0].name

  create_namespace = false

  timeout = 900

  values = [

    yamlencode({

      clusterName = var.cluster_name

      region = var.region

      vpcId = var.vpc_id

      serviceAccount = {

        create = true

        name = "aws-load-balancer-controller"

        annotations = {

          "eks.amazonaws.com/role-arn" = var.alb_controller_irsa_arn
        }
      }
    })
  ]
}

