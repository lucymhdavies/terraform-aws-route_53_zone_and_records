# AWS Route 53 Zone and Records

Defines an AWS Route 53 Zone and DNS entries, based on YAML files

## Usage

Terraform code:

```
module "dev-lmhd-me" {
  source = "lucymhdavies/route_53_zone_and_records/aws"

  name     = "dev.lmhd.me"
}
```

YAML files:

```
# Records, must be set
records:
- example.com

# Name, if not set, will use the filename (with suffix removed)
# name: example.dev.lmhd.me

# Optional fields
# type: CNAME
# ttl:  300
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Default TTL of a record, if unspecified | `string` | `"300"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Route 53 Zone | `string` | n/a | yes |
| <a name="input_records_path"></a> [records\_path](#input\_records\_path) | Directory to find YAML files for this zone. If not specified, will use the zone name | `string` | `""` | no |
| <a name="input_records_suffix"></a> [records\_suffix](#input\_records\_suffix) | n/a | `string` | `"yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_zone_arn"></a> [zone\_arn](#output\_zone\_arn) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | n/a |
| <a name="output_zone_name_servers"></a> [zone\_name\_servers](#output\_zone\_name\_servers) | n/a |
