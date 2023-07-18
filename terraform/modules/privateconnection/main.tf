provider "google" {}

locals {
    services  = [
      "servicenetworking.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each                   = toset(local.services)
  project                    = var.project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_service_networking_connection" "private_service_connection" {
  network                 = var.vpc
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = var.peering_ranges
  depends_on              = [google_project_service.services]
}
