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
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_route.egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_project_service.services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network"></a> [network](#input\_network) | n/a | <pre>object({<br>        name    = string<br>        routing = string<br>        router  = string<br>        nat     = string<br>        subnet  = object({<br>            name    = string<br>            cidr    = string<br>            private = bool<br><br>        })<br>    })</pre> | <pre>{<br>  "name": "kubernetes-cluster",<br>  "nat": "kubernetes-cluster-nat",<br>  "router": "kubernetes-cluster-router",<br>  "routing": "GLOBAL",<br>  "subnet": {<br>    "cidr": "10.10.0.0/16",<br>    "name": "kubernetes-cluster-subnet",<br>    "private": true<br>  }<br>}</pre> | no |
| <a name="input_network_primary_subnet"></a> [network\_primary\_subnet](#input\_network\_primary\_subnet) | Primary subnet to be used for the custom network | `string` | `"10.128.0.0/16"` | no |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project to create Workload Identity Service Account | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END_TF_DOCS -->