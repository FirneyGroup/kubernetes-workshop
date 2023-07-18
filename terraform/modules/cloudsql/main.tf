provider "google" {}

# list of apis to enable
locals {
    services  = [
    "sqladmin.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ]
}

resource "google_project_service" "services" {
  for_each                   = toset(local.services)
  project                    = var.project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_sql_database_instance" "instance" {
  name                = var.sql.name
  project             = var.project
  region              = var.region
  database_version    = var.sql.version
  deletion_protection = false

  settings {
    tier = var.sql.size
    ip_configuration {
      ipv4_enabled          = false
      private_network       = var.vpc
      allocated_ip_range    = var.peering_range
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



