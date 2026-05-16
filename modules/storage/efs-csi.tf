# EFS CSI Namespace
resource "kubernetes_namespace" "efs_csi" {

  metadata {

    name = "efs-csi"
  }
}

# EFS CSI Helm Release
resource "helm_release" "efs_csi" {

  name = "aws-efs-csi-driver"

  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver"

  chart = "aws-efs-csi-driver"

  namespace = kubernetes_namespace.efs_csi.metadata[0].name

  timeout = 900

  values = [

    yamlencode({

      controller = {

        serviceAccount = {

          create = true

          name = "efs-csi-controller-sa"

          annotations = {

            "eks.amazonaws.com/role-arn" = var.efs_csi_irsa_arn
          }
        }
      }
    })
  ]
}


