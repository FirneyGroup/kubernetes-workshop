provider "google" {}

# list of apis to enable
variable "services" {
  type = list(any)
  default = [
    "servicenetworking.googleapis.com"
  ]
}

resource "google_service_networking_connection" "private_service_connection" {
  network                 = var.vpc
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = var.peering_ranges
}
