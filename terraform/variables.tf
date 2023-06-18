# Project name to use
variable "gcp_project_id" {}

# GCP Billing ID used for project billing
variable "gcp_billing_id" {}

variable "create_new_gcp_project" {
  type        = bool
  default     = false
  description = "Automatically create a new gcp project"
}

# Region to deploy resources in
variable "gcp_region" {
  type        = string
  default     = "europe-west2"
  description = "Region to deploy resources"
}

# Zone to deploy resources in
variable "gcp_zone" {
  type        = string
  default     = "europe-west2-a"
  description = "Zone to deploy resources"
}

# List of IPs to whitelist for Kubernetes Admin access
variable "k8s_ip_whitelist" {
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