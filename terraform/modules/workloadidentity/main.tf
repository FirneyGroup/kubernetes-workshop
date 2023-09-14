provider "google" {}

# list of apis to enable
locals {
    services  = [
        "sqladmin.googleapis.com",
        "iamcredentials.googleapis.com",
    ]
}

resource "google_project_service" "services" {
    for_each                   = toset(local.services)
    project                    = var.project
    service                    = each.key
    disable_dependent_services = false
    disable_on_destroy         = false
}

# Create a service account for SQL use
resource "google_service_account" "sa" {
    account_id   = "workloadidentity-sa"
    project      = var.project
    display_name = "Service Account for Workload Identity"
    depends_on   = [ google_project_service.services ]
}

# Grant service account CloudSQL Client access
resource "google_project_iam_binding" "project" {
    project    = var.project
    role       = "roles/cloudsql.client"
    members    = [
        "serviceAccount:${google_service_account.sa.email}",
    ]
    depends_on = [ google_service_account.sa ]
}

# Bind service account agains Workload Identity Entity
resource "google_service_account_iam_binding" "sql-wi-binding" {
    service_account_id = google_service_account.sa.name
    role               = "roles/iam.workloadIdentityUser"
    members            = [
        "serviceAccount:${var.project}.svc.id.goog[workshop/wi-sa]",
    ]
    depends_on         = [ google_service_account.sa ]
}

