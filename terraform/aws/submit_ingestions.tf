resource "helm_release" "submit-ingestions" {
    name             = var.submit_ingestion_release_name
    chart            = var.submit_ingestion_chart_path
    namespace        = var.submit_ingestion_namespace
    create_namespace = var.submit_ingestion_create_namespace
    depends_on       = [helm_release.kafka, helm_release.druid_operator, helm_release.druid_cluster]
    wait_for_jobs    = var.submit_ingestion_wait_for_jobs
    timeout          = var.submit_ingestion_chart_install_timeout
}
