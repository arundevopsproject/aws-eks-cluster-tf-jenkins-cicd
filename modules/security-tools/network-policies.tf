# Default Deny Policy
resource "kubernetes_network_policy_v1" "default_deny" {

  metadata {

    name = "default-deny"

    namespace = kubernetes_namespace.restricted_apps.metadata[0].name
  }

  spec {

    pod_selector {}

    policy_types = [
      "Ingress",
      "Egress"
    ]
  }
}

# Allow DNS Policy
resource "kubernetes_network_policy_v1" "allow_dns" {

  metadata {

    name = "allow-dns"

    namespace = kubernetes_namespace.restricted_apps.metadata[0].name
  }

  spec {

    pod_selector {}

    policy_types = [
      "Egress"
    ]

    egress {

      to {

        namespace_selector {

          match_labels = {

            "kubernetes.io/metadata.name" = "kube-system"
          }
        }
      }

      ports {

        port = 53

        protocol = "UDP"
      }
    }
  }
}

