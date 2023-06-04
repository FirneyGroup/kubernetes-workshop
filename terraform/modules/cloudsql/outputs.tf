


output "sql_connection_name" {
  value = google_sql_database_instance.instance.connection_name
}

output "sql_ip" {
  value = google_sql_database_instance.instance.private_ip_address
}

output "sql_user" {
  value = var.sql.username
}

output "sql_pass" {
  value = var.sql.password
}