resource "kubernetes_network_policy" "jenkins" {

  metadata {

    name      = "jenkins-network-policy"
    namespace = "jenkins"
  }

  spec {

    pod_selector {}

    ingress {

      from {

        namespace_selector {}
      }
    }

    egress {

      to {}
    }

    policy_types = [
      "Ingress",
      "Egress"
    ]
  }
}
