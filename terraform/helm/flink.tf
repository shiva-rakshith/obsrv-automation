resource "helm_release" "flink" {
    name             = var.flink_release_name
    chart            = var.flink_chart_path
    namespace        = "${var.flink_namespace}-${var.env}"
    create_namespace = var.flink_create_namespace
    depends_on       = [helm_release.kafka]
    wait_for_jobs    = var.flink_wait_for_jobs
    timeout          = var.flink_chart_install_timeout
    
    values = [
      templatefile(var.flink_chart_custom_values_yaml,{})
    ]
}
