#=================
# Input To Module
#=================
variable "r53_domain_name" {}
variable "r53_record_set_name" {}
variable "r53_record_type" {}
variable "r53_alb_dns_name" {}
variable "r53_alb_zone_id" {}

#=============
# Route53
#=============
resource "aws_route53_zone" "r53_zone" {
  name = var.r53_domain_name
}

resource "aws_route53_record" "r53_record" {
  zone_id = aws_route53_zone.r53_zone.id
  name = var.r53_record_set_name
  type = var.r53_record_type
  alias {
    name = var.r53_alb_dns_name
    zone_id = var.r53_alb_zone_id
    evaluate_target_health = false
  }
}