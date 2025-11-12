output "vm_public_ip" {
  value = yandex_compute_instance.web.network_interface[0].nat_ip_address
}

output "vm_internal_ip" {
  value = yandex_compute_instance.web.network_interface[0].ip_address
}

output "bucket_name" {
  value = yandex_storage_bucket.this.bucket
}

output "sa_id" {
  value = yandex_iam_service_account.bucket_sa.id
}

output "sa_access_key_id" {
  value     = yandex_iam_service_account_static_access_key.bucket_sa_key.access_key
  sensitive = true
}

output "sa_secret_access_key" {
  value     = yandex_iam_service_account_static_access_key.bucket_sa_key.secret_key
  sensitive = true
}

output "pg_host_fqdn" {
  value = yandex_mdb_postgresql_cluster.this.host[0].fqdn
}

output "pg_db" {
  value = yandex_mdb_postgresql_database.db.name
}

output "pg_user" {
  value = yandex_mdb_postgresql_user.user.name
}

output "pg_password" {
  value     = random_password.pg_password.result
  sensitive = true
}
