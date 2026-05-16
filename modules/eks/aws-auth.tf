# aws-auth ConfigMap
resource "kubernetes_config_map_v1_data" "aws_auth" {

  depends_on = [
    aws_eks_cluster.this
  ]

  metadata {

    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {

    mapRoles = yamlencode([

      {
        rolearn = var.cluster_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"

        groups = [
          "system:bootstrappers",
          "system:nodes"
        ]
      }
    ])
  }
}

