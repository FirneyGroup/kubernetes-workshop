provider "google" {}

# list of apis to enable
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

# create a private peering range
resource "google_compute_global_address" "peering_range" {
  name          = "private"
  project       = var.project
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc
  depends_on    = [google_project_service.services]
}