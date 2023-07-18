provider "google" {}

# list of apis to enable
locals {
    services  = [
    "servicenetworking.googleapis.com",
    "compute.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each                   = toset(local.services)
  project                    = var.project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_compute_network" "vpc" {
  name                    = var.network.name
  project                 = var.project
  auto_create_subnetworks = false
  routing_mode            = var.network.routing
  depends_on              = [google_project_service.services]
  description             = "Create a VPC for the workshop"
}

resource "google_compute_subnetwork" "subnet" {
  name                     = var.network.subnet.name
  ip_cidr_range            = var.network.subnet.cidr
  project                  = var.project
  region                   = var.region
  private_ip_google_access = var.network.subnet.private
  network                  = google_compute_network.vpc.name
  depends_on               = [google_compute_network.vpc]
  description              = "Define a subnet for the custom network in the workshop"
}

resource "google_compute_route" "egress" {
  name             = "egress"
  project          = var.project
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_router" "router" {
  name        = var.network.router
  project     = var.project
  region      = google_compute_subnetwork.subnet.region
  network     = google_compute_network.vpc.id
  description = "Create a router for the NAT Gateway"
}

resource "google_compute_router_nat" "nat" {
  name                               = var.network.nat
  project                            = var.project
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnet.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

}