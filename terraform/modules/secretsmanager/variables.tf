variable "project" {
    type        = string
    description = "Google Cloud Project to config Secret Manager"
}

variable "wiServiceAccountEmail" {
    type        = string
    description = "Workload Identity Service Account"
}
