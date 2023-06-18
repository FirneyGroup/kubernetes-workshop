locals {
  project_id = var.create_new_gcp_project == false ? "${var.gcp_project_id}": "${var.gcp_project_id}-${random_string.random.result}"
}
resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}


resource "google_project" "project" {
  count           = var.create_new_gcp_project ? 1 : 0
  name            = var.gcp_project_id
  project_id      = local.project_id
  billing_account = var.gcp_billing_id
}

module "network" {
  source  = "./modules/network"
  project = local.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "cloudsql" {
  source  = "./modules/cloudsql"
  project = local.project_id
  vpc     = module.network.vpc
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "redis" {
  source  = "./modules/memorystore"
  project = local.project_id
  vpc     = module.network.vpc
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "gke" {
  source       = "./modules/gke"
  project      = local.project_id
  vpc          = module.network.vpc
  region       = var.gcp_region
  zone         = var.gcp_zone
  subnet       = module.network.subnet
  ip_whitelist = var.k8s_ip_whitelist
}

module "workloadidentity" {
  source     = "./modules/workloadidentity"
  project    = local.project_id
  depends_on = [ module.gke.cluster ]
}