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

module "internalpeering" {
  source  = "./modules/internalpeering"
  project = local.project_id
  vpc     = module.network.vpc
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "privateconnection" {
  source         = "./modules/privateconnection"
  project        = local.project_id
  vpc            = module.network.vpc
  region         = var.gcp_region
  zone           = var.gcp_zone
  peering_ranges = [
      module.internalpeering.peering_range
  ]
  depends_on     = [ module.internalpeering ]
}

module "cloudsql" {
  source        = "./modules/cloudsql"
  project       = local.project_id
  vpc           = module.network.vpc
  region        = var.gcp_region
  zone          = var.gcp_zone
  sql = {
      name      = var.sql_name
      version   = var.sql_version
      size      = var.sql_size
      username  = var.sql_username
      password  = var.sql_password
      database  = var.sql_database
  }
  peering_range = module.internalpeering.peering_range
  depends_on    = [ module.privateconnection ]
}

module "redis" {
  source        = "./modules/memorystore"
  project       = local.project_id
  vpc           = module.network.vpc
  region        = var.gcp_region
  zone          = var.gcp_zone
  redis = {
    name           = var.redis_name
    version        = var.redis_version
    tier           = var.redis_tier
    memory_size_gb = var.redis_memory_size_gb
  }
  peering_range = module.internalpeering.peering_range
  depends_on    = [ module.privateconnection ]
}

module "gke" {
  source       = "./modules/gke"
  project      = local.project_id
  vpc          = module.network.vpc
  region       = var.gcp_region
  zone         = var.gcp_zone
  subnet       = module.network.subnet
  cluster = {
      name          = var.cluster_name
      type          = var.cluster_type
      networking    = "VPC_NATIVE"
      master_cidr   = "10.100.100.0/28"
      pods_cidr     = "10.101.0.0/16"
      services_cidr = "10.102.0.0/16"
      nodepool = {
        name        = var.cluster_nodepool_name
        max         = var.cluster_nodepool_max
        min         = var.cluster_nodepool_min
        policy      = "BALANCED"
        preemptible = var.cluster_nodepool_preemptible
      }
  }
  ip_whitelist = var.k8s_ip_whitelist
}

module "workloadidentity" {
  source     = "./modules/workloadidentity"
  project    = local.project_id
  depends_on = [ module.gke.cluster ]
}