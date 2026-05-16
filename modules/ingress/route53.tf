# Public Hosted Zone Lookup
data "aws_route53_zone" "this" {

  name = var.domain_name

  private_zone = false
}

# Application DNS Record
resource "aws_route53_record" "app" {

  zone_id = data.aws_route53_zone.this.zone_id

  name = "apps.${var.domain_name}"

  type = "CNAME"

  ttl = 300

  records = [
    var.alb_dns_name
  ]
}

