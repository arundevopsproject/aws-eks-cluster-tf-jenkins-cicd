# CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "eks" {

  dashboard_name = "${var.environment}-eks-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type = "metric"

        width = 12

        height = 6

        properties = {

          metrics = [

            [
              "AWS/EKS",
              "cluster_failed_request_count",
              "ClusterName",
              var.cluster_name
            ]
          ]

          period = 300

          stat = "Sum"

          region = "ap-south-1"

          title = "EKS Failed Requests"
        }
      }
    ]
  })
}

