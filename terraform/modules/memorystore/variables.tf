variable "project" {
    type        = string
    description = "Google Cloud Project to create Workload Identity Service Account"
}

variable "vpc" {}
variable "region" {}
variable "zone" {}
variable "peering_range" {}

variable "redis" {
  type = object({
    name           = string
    version        = string
    tier           = string
    memory_size_gb = number
  })

  default = {
    name           = "cache"
    version        = "REDIS_4_0"
    tier           = "BASIC"
    memory_size_gb = 1
  }
}