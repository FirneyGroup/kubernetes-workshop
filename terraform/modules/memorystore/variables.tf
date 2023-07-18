//https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance
variable "project" {}
variable "vpc" {}
variable "region" {}
variable "zone" {}

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

variable "ip_range" {}



