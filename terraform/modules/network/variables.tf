variable "project" {}
variable "region" {}
variable "zone" {}

variable "network_primary_subnet" {
  type        = string
  default     = "10.128.0.0/16"
  description = "Primary subnet to be used for the custom network"
}

variable "network" {
    type = object({
        name    = string
        routing = string
        router  = string
        nat     = string
        subnet  = object({
            name    = string
            cidr    = string
            private = bool

        })
    })

    default = {
        name    = "kubernetes-cluster"
        routing = "GLOBAL"
        router  = "kubernetes-cluster-router"
        nat     = "kubernetes-cluster-nat"
        subnet  = {
            name    = "kubernetes-cluster-subnet"
            cidr    = "10.10.0.0/16"
            private = true
        }
    }
}