<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_project_service.services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.kubernetes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | n/a | <pre>object({<br>    name          = string<br>    networking    = string<br>    master_cidr   = string<br>    pods_cidr     = string<br>    services_cidr = string<br>    type          = string<br>    nodepool = object({<br>      name        = string<br>      min         = number<br>      max         = number<br>      zones       = list(string)<br>      policy      = string<br>      preemptible = bool<br>    })<br>  })</pre> | <pre>{<br>  "master_cidr": "10.100.100.0/28",<br>  "name": "workshop",<br>  "networking": "VPC_NATIVE",<br>  "nodepool": {<br>    "max": 5,<br>    "min": 1,<br>    "name": "workshop-nodepool",<br>    "policy": "BALANCED",<br>    "preemptible": true,<br>    "zones": []<br>  },<br>  "pods_cidr": "10.101.0.0/16",<br>  "services_cidr": "10.102.0.0/16",<br>  "type": "n1-standard-1"<br>}</pre> | no |
| <a name="input_ip_whitelist"></a> [ip\_whitelist](#input\_ip\_whitelist) | IP Whitelist for Kubernetes Cluster | <pre>list(object(<br>    { <br>      cidr_block   = string <br>      display_name = string<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "display_name": "Open to public"<br>  }<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project to create Workload Identity Service Account | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `any` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_kubectl_connect"></a> [kubectl\_connect](#output\_kubectl\_connect) | n/a |
<!-- END_TF_DOCS -->