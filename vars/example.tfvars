# if using existing project replace with the correct proejct ID
gcp_project_id = "firney-workshop"
gcp_region     = "europe-west2"
gcp_zone       = "europe-west2-a"

# SQL Instance and database details
# https://cloud.google.com/sql/docs/postgres/instance-settings
sql_name       = "workshop-sql-instance"
sql_version    = "POSTGRES_14"
sql_size       = "db-f1-micro"
sql_username   = "workshop-user"
sql_password   = "FirneyWorkshop!123"
sql_database   = "workshop-db"

# Memorystore Redis instance and size
redis_name           = "cache"
redis_version        = "REDIS_4_0"
redis_tier           = "BASIC"
redis_memory_size_gb = 1

# GKE Cluster instance and nodepool size
# https://cloud.google.com/compute/docs/general-purpose-machines#n1_machine_types
cluster_name                 = "workshop"
cluster_type                 = "n1-standard-2"
cluster_nodepool_name        = "workshop-nodepool"
cluster_nodepool_min         = 1
cluster_nodepool_max         = 5
cluster_nodepool_preemptible = true
cluster_nodepool_zones       = ["europe-west2-a",
                                "europe-west2-b",
                                "europe-west2-c"]
                                
# List of IPs to whitelist for Kubernetes Access
# must be in CIDR format
k8s_ip_whitelist = [{ 
  cidr_block   = "11.22.33.44/32" 
  display_name = "IP Address 1"
}]