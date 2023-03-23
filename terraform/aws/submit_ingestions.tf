resource "helm_release" "submit-ingestions" {
    name             = var.submit_ingestion_release_name
    chart            = var.submit_ingestion_chart_path
    namespace        = var.submit_ingestion_namespace
    create_namespace = var.submit_ingestion_create_namespace
    depends_on       = [helm_release.kafka, helm_release.druid_operator, helm_release.druid_cluster]
    wait_for_jobs    = var.submit_ingestion_wait_for_jobs
    timeout          = var.submit_ingestion_chart_install_timeout
        
    # values = [
    #   templatefile(var.submit_ingestion_chart_custom_values_yaml,
    #   {
    #       checkpoint_store_type = var.submit_ingestion_namespace
    #       s3_access_key         = coalesce(local.s3_access_key, "")
    #       s3_secret_key         = coalesce(local.s3_secret_key, "")
    #   })
    # ]
}
