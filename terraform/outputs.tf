output "kubectl_connect" {
  value = module.gke.kubectl_connect
}

output "redis_host" {
  value = module.redis.redis_host
}

output "redis_port" {
  value = module.redis.redis_port
}

output "sql_connection_name" {
  value = module.cloudsql.sql_connection_name
}

output "sql_ip" {
  value = module.cloudsql.sql_ip
}

output "sql_user" {
  value = module.cloudsql.sql_user
}

output "sql_pass" {
  value = module.cloudsql.sql_pass
}

output "wi_sa_email" {
    value = module.workloadidentity.wi_sa_email
}