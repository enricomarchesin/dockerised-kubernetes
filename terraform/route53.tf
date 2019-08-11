resource "aws_route53_zone" "base" {
  name = var.stack.domain
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.base.zone_id}"
  name    = "${var.stack.domain}"
  type    = "A"
  ttl     = "30"
  records = [
    aws_spot_instance_request.master.public_ip
    # aws_instance.master.public_ip
  ]
}

resource "aws_route53_record" "wildcard" {
  zone_id = "${aws_route53_zone.base.zone_id}"
  name    = "*.${var.stack.domain}"
  type    = "A"
  ttl     = "30"
  records = [
    aws_spot_instance_request.master.public_ip
    # aws_instance.master.public_ip
  ]
}

output "dns" {
  value = aws_route53_zone.base.name_servers
}
