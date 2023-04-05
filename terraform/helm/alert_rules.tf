resource "helm_release" "alertrules" {
    name             = var.alertrules_release_name
    chart            = var.alertrules_chart_path
    namespace        = var.alertrules_namespace
    create_namespace = var.alertrules_create_namespace
    depends_on       = [helm_release.monitoring]
    values = [
      templatefile(var.alertrules_chart_template,
        {
          alertrules_namespace = var.alertrules_namespace
        }
      )
    ]
}