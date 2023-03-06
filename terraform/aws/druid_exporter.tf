resource "helm_release" "druid_exporter" {
    name             = var.druid_exporter_release_name
    chart            = var.druid_exporter_chart_path
    # timeout          = var.druid_exporter_chart_install_timeout
    namespace        = var.druid_exporter_namespace
    create_namespace = var.druid_exporter_create_namespace
    wait_for_jobs    = var.druid_exporter_wait_for_jobs
    depends_on       = [helm_release.druid_cluster]
    values = [
        templatefile(var.druid_exporter_chart_template,
        {
            druid_exporter_namespace        = var.druid_exporter_namespace
            env                             = var.env
        }
        )
    ]
}