terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Setup the hosted zone
resource "aws_route53_zone" "zone" {
  name = var.name
}

#
# DNS Records
#

locals {
  records_path = var.records_path != "" ? var.records_path : var.name

  records_files = fileset(path.root, "${local.records_path}/*.${var.records_suffix}")
}

resource "aws_route53_record" "record" {
  for_each = local.records_files
  zone_id  = aws_route53_zone.zone.zone_id

  # Use the "name" key if specified
  # otherwise fallback to filename, minus .yaml
  name = lookup(
    yamldecode(file(each.key)),
    "name",
    trimsuffix(basename(each.key), ".${var.records_suffix}")
  )

  # Default to CNAME type unless told otherwise
  type = lookup(
    yamldecode(file(each.key)),
    "type",
    "CNAME"
  )

  # Use Default TTL unless told otherwise
  ttl = lookup(
    yamldecode(file(each.key)),
    "ttl",
    var.default_ttl
  )

  # We must have some records, otherwise this will fail
  records = yamldecode(file(each.key))["records"]
}


# TODO: allow delegation of subdomains, by passing in a list of NS records and Zone names
