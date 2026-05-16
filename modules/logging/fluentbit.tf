# Logging Namespace
resource "kubernetes_namespace" "logging" {

  metadata {

    name = "logging"
  }
}

# Fluent Bit Helm Release
resource "helm_release" "fluentbit" {

  name = "fluent-bit"

  repository = "https://fluent.github.io/helm-charts"

  chart = "fluent-bit"

  namespace = kubernetes_namespace.logging.metadata[0].name

  timeout = 900

  values = [

    yamlencode({

      serviceAccount = {

        create = true

        name = "fluent-bit"
      }

      config = {

        outputs = <<-EOT
[OUTPUT]
    Name cloudwatch_logs
    Match *
    region ap-south-1
    log_group_name ${var.cloudwatch_log_group_name}
    log_stream_prefix fluentbit-
    auto_create_group true
EOT
      }
    })
  ]
}

