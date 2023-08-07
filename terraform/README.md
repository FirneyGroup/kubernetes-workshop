<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.76.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudsql"></a> [cloudsql](#module\_cloudsql) | ./modules/cloudsql | n/a |
| <a name="module_gke"></a> [gke](#module\_gke) | ./modules/gke | n/a |
| <a name="module_internalpeering"></a> [internalpeering](#module\_internalpeering) | ./modules/internalpeering | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_privateconnection"></a> [privateconnection](#module\_privateconnection) | ./modules/privateconnection | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/memorystore | n/a |
| <a name="module_workloadidentity"></a> [workloadidentity](#module\_workloadidentity) | ./modules/workloadidentity | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | GKE Cluster name | `string` | `"workshop"` | no |
| <a name="input_cluster_nodepool_max"></a> [cluster\_nodepool\_max](#input\_cluster\_nodepool\_max) | n/a | `number` | `2` | no |
| <a name="input_cluster_nodepool_min"></a> [cluster\_nodepool\_min](#input\_cluster\_nodepool\_min) | n/a | `number` | `1` | no |
| <a name="input_cluster_nodepool_name"></a> [cluster\_nodepool\_name](#input\_cluster\_nodepool\_name) | GKE Cluster Nodepool name | `string` | `"workshop-nodepool"` | no |
| <a name="input_cluster_nodepool_preemptible"></a> [cluster\_nodepool\_preemptible](#input\_cluster\_nodepool\_preemptible) | n/a | `bool` | `true` | no |
| <a name="input_cluster_nodepool_zones"></a> [cluster\_nodepool\_zones](#input\_cluster\_nodepool\_zones) | GKE Cluster Nodepool zones | `list(string)` | n/a | yes |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | GKE Cluster Node Size | `string` | `"n1-standard-1"` | no |
| <a name="input_create_new_gcp_project"></a> [create\_new\_gcp\_project](#input\_create\_new\_gcp\_project) | Automatically create a new gcp project | `bool` | `false` | no |
| <a name="input_gcp_billing_id"></a> [gcp\_billing\_id](#input\_gcp\_billing\_id) | GCP Billing ID used for project billing | `string` | `"012345-XXXXXX-123ABC"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | Project name to use | `any` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to deploy resources | `string` | `"europe-west2"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to deploy resources | `string` | `"europe-west2-a"` | no |
| <a name="input_k8s_ip_whitelist"></a> [k8s\_ip\_whitelist](#input\_k8s\_ip\_whitelist) | IP Whitelist for GKE cluster access | <pre>list(object(<br>    { <br>      cidr_block   = string <br>      display_name = string<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "display_name": "Open to public"<br>  }<br>]</pre> | no |
| <a name="input_redis_memory_size_gb"></a> [redis\_memory\_size\_gb](#input\_redis\_memory\_size\_gb) | Memorystore Redis memory size | `number` | `1` | no |
| <a name="input_redis_name"></a> [redis\_name](#input\_redis\_name) | Memorystore instance name | `string` | `"cache"` | no |
| <a name="input_redis_tier"></a> [redis\_tier](#input\_redis\_tier) | Memorystore Redis availability tier | `string` | `"BASIC"` | no |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | Memoerystore Redis version | `string` | `"REDIS_4_0"` | no |
| <a name="input_sql_database"></a> [sql\_database](#input\_sql\_database) | SQL database name | `string` | `"workshop-db"` | no |
| <a name="input_sql_name"></a> [sql\_name](#input\_sql\_name) | Name of the SQL instance | `string` | `"workshop-sql-instance"` | no |
| <a name="input_sql_password"></a> [sql\_password](#input\_sql\_password) | SQL database password | `string` | `"FirneyWorkshop!123"` | no |
| <a name="input_sql_size"></a> [sql\_size](#input\_sql\_size) | Size of the SQL instance | `string` | `"db-f1-micro"` | no |
| <a name="input_sql_username"></a> [sql\_username](#input\_sql\_username) | SQL database username | `string` | `"workshop-user"` | no |
| <a name="input_sql_version"></a> [sql\_version](#input\_sql\_version) | SQL Engine to use (Mysql, Postgres, etc) | `string` | `"POSTGRES_14"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubectl_connect"></a> [kubectl\_connect](#output\_kubectl\_connect) | n/a |
| <a name="output_redis_host"></a> [redis\_host](#output\_redis\_host) | n/a |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | n/a |
| <a name="output_sql_connection_name"></a> [sql\_connection\_name](#output\_sql\_connection\_name) | n/a |
| <a name="output_sql_ip"></a> [sql\_ip](#output\_sql\_ip) | n/a |
| <a name="output_sql_pass"></a> [sql\_pass](#output\_sql\_pass) | n/a |
| <a name="output_sql_user"></a> [sql\_user](#output\_sql\_user) | n/a |
| <a name="output_wi_sa_email"></a> [wi\_sa\_email](#output\_wi\_sa\_email) | n/a |
<!-- END_TF_DOCS -->