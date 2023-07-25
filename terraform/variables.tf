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

variable "sql_name" {
  type        = string
  default     = "workshop-sql-instance"
  description = "Name of the SQL instance"
}

variable "sql_version"  {
  type        = string
  default     = "POSTGRES_14"
  description = "SQL Engine to use (Mysql, Postgres, etc)"
}

variable "sql_size"  {
  type        = string
  default     = "db-f1-micro"
  description = "Size of the SQL instance"
}

variable "sql_username"  {
  type        = string
  default     = "workshop-user"
  description = "SQL database username"
}

variable "sql_password"  {
  type        = string
  default     = "FirneyWorkshop!123"
  description = "SQL database password"
}

variable "sql_database"  {
  type        = string
  default     = "workshop-db"
  description = "SQL database name"
}


variable "redis_name"  {
  type        = string
  default     = "cache"
  description = "Memorystore instance name"
}

variable "redis_version"  {
  type        = string
  default     = "REDIS_4_0"
  description = "Memoerystore Redis version"
}

variable "redis_tier"  {
  type        = string
  default     = "BASIC"
  description = "Memorystore Redis availability tier"
}
variable "redis_memory_size_gb"  {
  type        = number
  default     = 1
  description = "Memorystore Redis memory size"
}

variable "cluster_name"  {
  type        = string
  default     = "workshop"
  description = "GKE Cluster name"
}

variable "cluster_type"  {
  type        = string
  default     = "n1-standard-1"
  description = "GKE Cluster Node Size"
}

variable "cluster_nodepool_name"  {
  type        = string
  default     = "workshop-nodepool"
  description = "GKE Cluster Nodepool name"
}

variable "cluster_nodepool_min"  {
  type        = number
  default     = 1
}

variable "cluster_nodepool_max"  {
  type        = number
  default     = 2
}

variable "cluster_nodepool_preemptible"  {
  type        = bool
  default     = true
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
  description = "IP Whitelist for GKE cluster access"
}