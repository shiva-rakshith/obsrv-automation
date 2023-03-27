resource "helm_release" "api" {
    name             = var.api_release_name
    chart            = var.api_chart_path
    namespace        = var.api_namespace
    create_namespace = var.api_create_namespace
    depends_on       = [helm_release.druid_operator, helm_release.druid_cluster]
    values = [
      templatefile(var.api_chart_template,
        {
          env        = var.env
          api_namespace = var.api_namespace
        }
      )
    ]
}