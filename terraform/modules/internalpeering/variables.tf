variable "project" {
    type        = string
    description = "Google Cloud Project to create Workload Identity Service Account"
}

variable "vpc" {}
variable "region" {}
variable "zone" {}

variable "ip_name" {
  type    = string
  default = "private-sql-ip-address"
}