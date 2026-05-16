# Kyverno Namespace
resource "kubernetes_namespace" "kyverno" {

  metadata {

    name = "kyverno"
  }
}

# Kyverno Helm Release
resource "helm_release" "kyverno" {

  name = "kyverno"

  repository = "https://kyverno.github.io/kyverno"

  chart = "kyverno"

  namespace = kubernetes_namespace.kyverno.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      admissionController = {

        replicas = 2
      }

      backgroundController = {

        replicas = 2
      }

      cleanupController = {

        replicas = 2
      }
    })
  ]
}

# Require Resource Limits Policy
resource "kubernetes_manifest" "require_limits" {

  manifest = {

    apiVersion = "kyverno.io/v1"

    kind = "ClusterPolicy"

    metadata = {

      name = "require-resource-limits"
    }

    spec = {

      validationFailureAction = "enforce"

      rules = [

        {
          name = "validate-resources"

          match = {

            resources = {

              kinds = [
                "Pod"
              ]
            }
          }

          validate = {

            message = "CPU and memory limits are required"

            pattern = {

              spec = {

                containers = [

                  {
                    resources = {

                      limits = {

                        memory = "?*"
                        cpu    = "?*"
                      }
                    }
                  }
                ]
              }
            }
          }
        }
      ]
    }
  }
}

