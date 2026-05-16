# External Secrets Namespace
resource "kubernetes_namespace" "external_secrets" {

  metadata {

    name = "external-secrets"
  }
}

# External Secrets Operator
resource "helm_release" "external_secrets" {

  name = "external-secrets"

  repository = "https://charts.external-secrets.io"

  chart = "external-secrets"

  namespace = kubernetes_namespace.external_secrets.metadata[0].name

  timeout = 1200

  values = [

    yamlencode({

      serviceAccount = {

        create = true

        name = "external-secrets"

        annotations = {

          "eks.amazonaws.com/role-arn" = var.external_secrets_irsa_role_arn
        }
      }
    })
  ]
}

# Cluster Secret Store
resource "kubernetes_manifest" "cluster_secret_store" {

  manifest = {

    apiVersion = "external-secrets.io/v1beta1"

    kind = "ClusterSecretStore"

    metadata = {

      name = "aws-secretsmanager"
    }

    spec = {

      provider = {

        aws = {

          service = "SecretsManager"

          region = var.region

          auth = {

            jwt = {

              serviceAccountRef = {

                name = "external-secrets"

                namespace = kubernetes_namespace.external_secrets.metadata[0].name
              }
            }
          }
        }
      }
    }
  }
}

# External Secret
resource "kubernetes_manifest" "database_secret" {

  manifest = {

    apiVersion = "external-secrets.io/v1beta1"

    kind = "ExternalSecret"

    metadata = {

      name = "database-secret"

      namespace = "default"
    }

    spec = {

      refreshInterval = "1h"

      secretStoreRef = {

        name = "aws-secretsmanager"

        kind = "ClusterSecretStore"
      }

      target = {

        name = "database-secret"
      }

      data = [

        {
          secretKey = "username"

          remoteRef = {

            key = aws_secretsmanager_secret.database.name

            property = "username"
          }
        },

        {
          secretKey = "password"

          remoteRef = {

            key = aws_secretsmanager_secret.database.name

            property = "password"
          }
        }
      ]
    }
  }
}

