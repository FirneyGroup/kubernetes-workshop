# Project ID to used for project creation
create_new_gcp_project  = false

# if using existing project replace with the correct proejct ID
gcp_project_id          = "firney-workshop"
gcp_region              = "europe-west2"
gcp_zone                = "europe-west2-a"

# get billing account id "gcloud alpha billing accounts list"
# only needed when creating_new_gcp_project is set to true
gcp_billing_id          = "123abc-123abc-123abc"

# List of IPs to whitelist for Kubernetes Access
# must be in CIDR format
k8s_ip_whitelist        = [   
    { 
        cidr_block   = "11.22.33.44/32" 
        display_name = "IP Address 1"
    }
]
