variable "project" {}
variable "vpc" {}
variable "region" {}
variable "zone" {}

variable "sql" {
  type = object({
    name     = string
    version  = string
    size     = string
    username = string
    password = string
  })

  default = {
    name     = "workshop-sql-instance"
    version  = "POSTGRES_14"
    size     = "db-f1-micro"
    username = "workshop-user"
    password = "FirneyWorkshop!123"
  }
}

variable "ip_range" {}



