output "zone_name_servers" {
  value = aws_route53_zone.zone.name_servers
}

output "zone_arn" {
  value = aws_route53_zone.zone.arn
}

output "zone_id" {
  value = aws_route53_zone.zone_id
}
