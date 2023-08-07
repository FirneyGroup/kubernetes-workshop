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
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_peering_range"></a> [peering\_range](#input\_peering\_range) | n/a | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project to create Workload Identity Service Account | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_sql"></a> [sql](#input\_sql) | n/a | <pre>object({<br>    name     = string<br>    version  = string<br>    size     = string<br>    username = string<br>    password = string<br>    database = string<br>  })</pre> | <pre>{<br>  "database": "workshop-db",<br>  "name": "workshop-sql-instance",<br>  "password": "FirneyWorkshop!123",<br>  "size": "db-f1-micro",<br>  "username": "workshop-user",<br>  "version": "POSTGRES_14"<br>}</pre> | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_connection_name"></a> [sql\_connection\_name](#output\_sql\_connection\_name) | n/a |
| <a name="output_sql_ip"></a> [sql\_ip](#output\_sql\_ip) | n/a |
| <a name="output_sql_pass"></a> [sql\_pass](#output\_sql\_pass) | n/a |
| <a name="output_sql_user"></a> [sql\_user](#output\_sql\_user) | n/a |
<!-- END_TF_DOCS -->