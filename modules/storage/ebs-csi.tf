# EBS CSI Driver Namespace
resource "kubernetes_namespace" "ebs_csi" {

  metadata {

    name = "ebs-csi"
  }
}

# EBS CSI Driver Helm Release
resource "helm_release" "ebs_csi" {

  name = "aws-ebs-csi-driver"

  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"

  chart = "aws-ebs-csi-driver"

  namespace = kubernetes_namespace.ebs_csi.metadata[0].name

  timeout = 900

  values = [

    yamlencode({

      controller = {

        serviceAccount = {

          create = true

          name = "ebs-csi-controller-sa"

          annotations = {

            "eks.amazonaws.com/role-arn" = var.ebs_csi_irsa_arn
          }
        }
      }
    })
  ]
}


