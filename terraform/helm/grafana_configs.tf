resource "helm_release" "grafana_configs" {
    name             = var.grafana_configs_release_name
    chart            = var.grafana_configs_chart_path
    namespace        = var.grafana_configs_namespace
    depends_on       = [helm_release.monitoring]
    wait_for_jobs    = var.grafana_configs_wait_for_jobs
    timeout          = var.grafana_configs_chart_install_timeout
}