provider "google" {}

# list of apis to enable
variable "services" {
  type = list(any)
  default = [
    "redis.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each                   = toset(var.services)
  project                    = var.project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}

# resource "google_service_networking_connection" "private_service_connection" {
#   network                 = var.vpc
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.service_range.name]
#   depends_on    = [ google_compute_global_address.service_range ]
# }

resource "google_redis_instance" "cache" {
  name               = var.redis.name
  project            = var.project
  region             = var.region
  location_id        = var.zone
  tier               = var.redis.tier
  memory_size_gb     = var.redis.memory_size_gb
  authorized_network = var.vpc
  reserved_ip_range  = var.ip_range
  connect_mode       = "PRIVATE_SERVICE_ACCESS"
  redis_version      = var.redis.version
  display_name       = "Terraform Test Instance"
  depends_on         = [ google_project_service.services]
  # google_service_networking_connection
}