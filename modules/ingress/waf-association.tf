# Associate WAF with ALB
resource "aws_wafv2_web_acl_association" "this" {

  resource_arn = var.alb_arn

  web_acl_arn = var.waf_acl_arn
}

