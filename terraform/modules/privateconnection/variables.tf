//https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance
variable "project" {}
variable "vpc" {}
variable "region" {}
variable "zone" {}

variable "peering_ranges" {
  type = list(string)
}