variable "project" {
    type        = string
    description = "Google Cloud Project to create Workload Identity Service Account"
}

variable "vpc" {}
variable "region" {}
variable "zone" {}

variable "peering_ranges" {
  type = list(string)
  description = "List of ranges to create VPC private peering routes"
}