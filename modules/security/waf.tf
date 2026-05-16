# WAF ACL
resource "aws_wafv2_web_acl" "eks" {

  name  = "${var.environment}-eks-waf"
  scope = "REGIONAL"

  default_action {

    allow {}
  }

  visibility_config {

    cloudwatch_metrics_enabled = true

    metric_name = "${var.environment}-eks-waf"

    sampled_requests_enabled = true
  }

  rule {

    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {

      none {}
    }

    statement {

      managed_rule_group_statement {

        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {

      cloudwatch_metrics_enabled = true

      metric_name = "CommonRuleSet"

      sampled_requests_enabled = true
    }
  }

  tags = local.common_tags
}
