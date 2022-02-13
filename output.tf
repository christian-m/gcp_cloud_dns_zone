output "soa_name" {
  value = google_dns_managed_zone.default.name_servers[0]
}

output "dns_names" {
  value = google_dns_managed_zone.default.name_servers
}