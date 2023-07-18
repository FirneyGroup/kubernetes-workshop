provider "google" {}

# list of apis to enable
variable "services" {
  type = list(any)
  default = [
    "servicenetworking.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each                   = toset(var.services)
  project                    = var.project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}
resource "google_compute_global_address" "sql" {
  name          = "sql"
  project       = var.project
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc
  depends_on    = [google_project_service.services]
}

resource "google_compute_global_address" "redis" {
  name          = "redis"
  project       = var.project
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc
  depends_on    = [google_project_service.services]
}