provider "google" {}

# list of apis to enable
variable "services" {
  type = list(any)
  default = [
    "sqladmin.googleapis.com",
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
  name          = var.ip_name
  project       = var.project
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc
  depends_on    = [google_project_service.services]
}

resource "google_service_networking_connection" "private" {
  network                 = var.vpc
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.sql.name]
  depends_on              = [google_project_service.services]
}

resource "google_sql_database_instance" "instance" {
  name                = var.sql.name
  project             = var.project
  region              = var.region
  database_version    = var.sql.version
  deletion_protection = false
  depends_on          = [google_service_networking_connection.private]

  settings {
    tier = var.sql.size
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.vpc
      enable_private_path_for_google_cloud_services = true
    }

    location_preference {
      zone = var.zone
    }
  }
}

resource "google_sql_user" "users" {
  name     = var.sql.username
  project  = var.project
  instance = google_sql_database_instance.instance.id
  password = var.sql.password
  depends_on = [ google_sql_database_instance.instance ]
}



