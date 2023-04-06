output "postgresql_admin_username" {
  value     = var.postgresql_admin_username
  sensitive = true
}

output "postgresql_admin_password" {
  value     = var.postgresql_admin_password
  sensitive = true
}

output "postgresql_superset_user_password" {
  value     = var.postgresql_superset_user_password
  sensitive = true
}

output "postgresql_flink_user_password" {
  value     = var.postgresql_flink_user_password
  sensitive = true
}

output "postgresql_druid_raw_user_password" {
  value     = var.postgresql_druid_raw_user_password
  sensitive = true
}

output "postgresql_dataset_api_user_password" {
  value     = var.postgresql_dataset_api_user_password
  sensitive = true
}