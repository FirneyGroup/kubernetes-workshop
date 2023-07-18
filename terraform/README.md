<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.67.0 |
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
| <a name="input_create_new_gcp_project"></a> [create\_new\_gcp\_project](#input\_create\_new\_gcp\_project) | Automatically create a new gcp project | `bool` | `false` | no |
| <a name="input_gcp_billing_id"></a> [gcp\_billing\_id](#input\_gcp\_billing\_id) | GCP Billing ID used for project billing | `any` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | Project name to use | `any` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to deploy resources | `string` | `"europe-west2"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to deploy resources | `string` | `"europe-west2-a"` | no |
| <a name="input_k8s_ip_whitelist"></a> [k8s\_ip\_whitelist](#input\_k8s\_ip\_whitelist) | IP Whitelist for Kubernetes Cluster | <pre>list(object(<br>    { <br>      cidr_block   = string <br>      display_name = string<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "display_name": "Open to public"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->