output "kubectl_connect" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --zone ${google_container_cluster.primary.location} --project ${var.project}"
}

output "cluster" {
  value = google_container_cluster.primary.id
}

