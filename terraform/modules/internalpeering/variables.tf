variable "project" {}
variable "vpc" {}
variable "region" {}
variable "zone" {}

variable "ip_name" {
  type    = string
  default = "private-sql-ip-address"
}