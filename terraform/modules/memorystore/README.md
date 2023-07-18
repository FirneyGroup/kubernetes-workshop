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
| [google_project_service.services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_redis_instance.cache](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_peering_range"></a> [peering\_range](#input\_peering\_range) | n/a | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project to create Workload Identity Service Account | `string` | n/a | yes |
| <a name="input_redis"></a> [redis](#input\_redis) | n/a | <pre>object({<br>    name           = string<br>    version        = string<br>    tier           = string<br>    memory_size_gb = number<br>  })</pre> | <pre>{<br>  "memory_size_gb": 1,<br>  "name": "cache",<br>  "tier": "BASIC",<br>  "version": "REDIS_4_0"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_host"></a> [redis\_host](#output\_redis\_host) | n/a |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | n/a |
<!-- END_TF_DOCS -->