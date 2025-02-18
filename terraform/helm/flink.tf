resource "helm_release" "flink" {
    name             = var.flink_release_name
    chart            = var.flink_chart_path
    namespace        = var.flink_namespace
    create_namespace = var.flink_create_namespace
    depends_on       = [helm_release.kafka]
    wait_for_jobs    = var.flink_wait_for_jobs
    timeout          = var.flink_chart_install_timeout
    values = [
      templatefile(var.flink_chart_template,
      {
          checkpoint_store_type   = var.flink_checkpoint_store_type
          s3_access_key           = try(local.storage.s3_access_key, "")
          s3_secret_key           = try(local.storage.s3_secret_key, "")
          azure_account           = try(local.storage.azure_storage_account_name, "")
          azure_secret            = try(local.storage.azure_storage_account_key, "")
      })
    ]
}