variable "environment" {
  description = "environment where this resource is used"
  type        = string
}

variable "zone_name" {
  description = "dns zone name that will be registered"
  type        = string
}

variable "domain_records" {
  description = "domain records to register"
  type        = map(object({
    name   = string,
    type   = string,
    ttl    = string,
    values = list(string),
  }))
  default = {}
}

locals {
  domain_zone_name = replace(var.zone_name, ".", "-" )
}