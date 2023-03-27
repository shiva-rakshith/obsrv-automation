resource "helm_release" "api" {
    name             = var.api_release_name
    chart            = var.api_chart_path
    timeout          = var.api_chart_install_timeout
    namespace        = var.api_namespace
    create_namespace = var.api_create_namespace
    depends_on       = [helm_release.druid_operator, helm_release.druid_cluster]
    wait_for_jobs    = var.api_wait_for_jobs
    values = [
      templatefile(var.api_chart_template,
        {
          env        = var.env
        }
      )
    ]
}