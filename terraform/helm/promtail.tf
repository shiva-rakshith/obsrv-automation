resource "helm_release" "promtail" {
    name             = var.promtail_release_name
    repository       = var.promtail_chart_repository
    chart            = var.promtail_chart_name
    version          = var.promtail_chart_version
    namespace        = var.promtail_namespace
    create_namespace = var.promtail_create_namespace
    wait_for_jobs    = var.promtail_wait_for_jobs
    timeout          = var.promtail_install_timeout
    values = [
      templatefile(var.promtail_chart_template,
        {
          promtail_service_monitor_status  = var.promtail_service_monitor_status
          promtail_service_monitor_label   = var.promtail_service_monitor_label
        }
      )
    ]
}