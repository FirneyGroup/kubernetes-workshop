variable "project" {}
variable "vpc" {}
variable "subnet" {}
variable "region" {}
variable "zone" {}

variable "ip_whitelist" {
  type = list(object(
    { 
      cidr_block   = string 
      display_name = string
    }
  ))
  default = [ 
    { 
      cidr_block   = "0.0.0.0/0"
      display_name = "Open to public"
    } 
  ]
  description = "IP Whitelist for Kubernetes Cluster"
}

variable "cluster" {
  type = object({
    name          = string
    networking    = string
    master_cidr   = string
    pods_cidr     = string
    services_cidr = string
    type          = string
    nodepool = object({
      name        = string
      initial     = number
      min         = number
      max         = number
      policy      = string
      preemptible = bool
    })
  })

  default = {
    name          = "workshop"
    networking    = "VPC_NATIVE"
    master_cidr   = "10.100.100.0/28"
    pods_cidr     = "10.101.0.0/16"
    services_cidr = "10.102.0.0/16"
    type          = "n1-standard-1"
    nodepool = {
      name        = "workshop-nodepool"
      initial     = 1
      min         = 1
      max         = 2
      policy      = "BALANCED"
      preemptible = true
    }
  }
}

