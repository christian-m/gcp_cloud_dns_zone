resource "google_dns_managed_zone" "default" {
  name        = local.domain_zone_name
  dns_name    = "${var.zone_name}."
  description = "${var.zone_name} DNS zone"

  labels = {
    env = var.environment
  }
}

module "dns_record" {
  source      = "git::git@bitbucket.org:christian_m/gcp_cloud_dns_resource_record.git?ref=v1.0"
  for_each = var.domain_records

  environment = var.environment
  zone_name   = google_dns_managed_zone.default.name
  record      = {
    name   = "${each.value.name}${google_dns_managed_zone.default.dns_name}",
    type   = each.value.type,
    ttl    = each.value.ttl,
    values = each.value.values,
  }
}