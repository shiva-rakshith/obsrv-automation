resource "helm_release" "secor" {
  count            = length(var.jobs)
  name             = var.jobs[count.index]
  chart            = var.secor_chart_path
  namespace        = var.secor_namespace
  create_namespace = var.secor_create_namespace
  depends_on       = [helm_release.kafka]
  wait_for_jobs    = var.secor_wait_for_jobs
  values = [
    templatefile(var.secor_chart_template,
      {
        deployment_stage       = var.env
        secor_namespace        = var.secor_namespace
        base_path              = var.secor_backup_basepath
        timestamp_key          = "syncts"
        fallback_timestamp_key = ""
        env                    = var.env
        kafka_broker_host      = var.kafka_broker_ip
        zookeeper_quorum       = var.kafka_zookeeper_ip
        backup_pv_size         = var.secor_backup_pv_size
        request_cpu            = var.secor_cpu_request
        request_memory         = var.secor_memory_request
        secor_cpu_limit        = var.secor_cpu_limit
        secor_memory_limit     = var.secor_memory_limit
        secor_image_tag        = var.secor_image_tag
        image_repository       = var.secor_image_repository
        cloud_storage_bucket   = var.cloud_storage_bucket
        region                 = "us-east-2",
        file_size              = var.secor_backup_max_file_size
        file_age               = var.secor_backup_interval
        threads                = var.secor_threads_count

      }
    )
  ]
}
