variable "name" {
  type        = string
  description = "Name of the Route 53 Zone"
}

variable "default_ttl" {
  type        = string
  default     = "300"
  description = "Default TTL of a record, if unspecified"
}

variable "records_path" {
  type    = string
  default = ""

  description = "Directory to find YAML files for this zone. If not specified, will use the zone name"
}

variable "records_suffix" {
  type    = string
  default = "yaml"
}
