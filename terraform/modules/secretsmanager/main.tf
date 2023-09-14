provider "google" {}

# list of apis to enable
locals {
    services  = [
        "secretmanager.googleapis.com",
    ]
}

resource "google_project_service" "services" {
    for_each                   = toset(local.services)
    project                    = var.project
    service                    = each.key
    disable_dependent_services = false
    disable_on_destroy         = false
}

resource "google_secret_manager_secret" "secret" {

    secret_id = "workshop-password"
    project   = var.project
    
    replication {
        automatic = true
    }

    depends_on = [google_project_service.services]
}

resource "google_secret_manager_secret_iam_member" "workloadidentity" {
    secret_id = google_secret_manager_secret.secret.id
    role      = "roles/secretmanager.secretAccessor"
    member    = "serviceAccount:${var.wiServiceAccountEmail}" # or serviceAccount:my-app@...
}

resource "google_secret_manager_secret_version" "password" {
    secret = google_secret_manager_secret.secret.id
    secret_data = "SecretPassword123"
}