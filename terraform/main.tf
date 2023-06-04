resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}

resource "google_project" "project" {
  name            = var.gcp_project_id
  project_id      = "${var.gcp_project_id}-${random_string.random.result}"
  billing_account = var.gcp_billing_id
}

module "network" {
  source  = "./modules/network"
  project = google_project.project.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "cloudsql" {
  source  = "./modules/cloudsql"
  project = google_project.project.project_id
  vpc     = module.network.vpc
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "redis" {
  source  = "./modules/memorystore"
  project = google_project.project.project_id
  vpc     = module.network.vpc
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "gke" {
  source       = "./modules/gke"
  project      = google_project.project.project_id
  vpc          = module.network.vpc
  region       = var.gcp_region
  zone         = var.gcp_zone
  subnet       = module.network.subnet
  ip_whitelist = var.k8s_ip_whitelist
}

module "workloadidentity" {
  source     = "./modules/workloadidentity"
  project    = google_project.project.project_id
  depends_on = [ module.gke.cluster ]
}