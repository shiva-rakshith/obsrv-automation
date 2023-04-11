resource "helm_release" "superset-charts" {
    name             = var.superset_charts_release_name
    chart            = var.superset_charts_chart_path
    namespace        = var.superset_charts_namespace
    create_namespace = var.superset_create_namespace
    depends_on       = [helm_release.superset, helm_release.druid_operator, helm_release.druid_cluster]
    wait_for_jobs    = var.superset_charts_wait_for_jobs
    timeout          = var.superset_chart_install_timeout
}
