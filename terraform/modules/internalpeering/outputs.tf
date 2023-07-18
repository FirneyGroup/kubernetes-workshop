output "redis" {
 value = google_compute_global_address.redis.name
}

output "sql" {
 value = google_compute_global_address.sql.name
}