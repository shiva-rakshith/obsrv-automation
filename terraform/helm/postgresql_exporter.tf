resource "helm_release" "postgresql_exporter" {
    name             = var.postgresql_exporter_release_name
    chart            = var.postgresql_exporter_chart_path
    namespace        = var.postgresql_exporter_namespace
    create_namespace = var.postgresql_exporter_create_namespace
    wait_for_jobs    = var.postgresql_exporter_wait_for_jobs
    depends_on       = [helm_release.druid_cluster,helm_release.postgres]
    values = [
        templatefile(var.postgresql_exporter_chart_template,
        {
         postgresql_exporter_namespace = var.postgresql_exporter_namespace   
        })
    ]
}