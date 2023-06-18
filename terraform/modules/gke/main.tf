provider "google" {}

# list of required APIs
variable "services" {
  type = list(any)
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ]
}

# Ensure the relevant APIs are enabled
resource "google_project_service" "services" {
  for_each                   = toset(var.services)
  project                    = var.project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}

# Create a service account for the Kubernetes Cluster
resource "google_service_account" "kubernetes" {
  account_id   = "kubernetes-sa-id"
  display_name = "Kubernetes Service Account"
  project      = var.project
  depends_on   = [google_project_service.services]
}

# Create a kubernetes cluster
resource "google_container_cluster" "primary" {
  name                     = var.cluster.name
  project                  = var.project
  location                 = var.zone
  networking_mode          = var.cluster.networking
  network                  = var.vpc
  subnetwork               = var.subnet
  remove_default_node_pool = true
  initial_node_count       = var.cluster.nodepool.initial
  depends_on = [google_service_account.kubernetes]

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.cluster.master_cidr
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster.pods_cidr
    services_ipv4_cidr_block = var.cluster.services_cidr
  }

  master_authorized_networks_config {
 
    dynamic "cidr_blocks" {
      for_each = var.ip_whitelist
      content {
        display_name = cidr_blocks.value.display_name
        cidr_block   = cidr_blocks.value.cidr_block
      }
    }

  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

# Create a seperate node pool
resource "google_container_node_pool" "nodes" {
  name       = var.cluster.nodepool.name
  location   = var.zone
  cluster    = google_container_cluster.primary.id
  depends_on = [google_container_cluster.primary]
  node_count = var.cluster.nodepool.initial

  autoscaling {
    total_min_node_count = var.cluster.nodepool.min
    total_max_node_count = var.cluster.nodepool.max
    location_policy      = var.cluster.nodepool.policy
  }

  network_config {
    enable_private_nodes = true
  }

  node_config {
    machine_type = var.cluster.type
    preemptible  = var.cluster.nodepool.preemptible

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.kubernetes.email

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  timeouts {
    create = "30m"
    update = "20m"
  }
}
