resource "helm_release" "alertrules" {
    name             = var.alertrules_release_name
    chart            = "${path.module}/${var.alertrules_chart_path}"
    namespace        = var.alertrules_namespace
    create_namespace = var.alertrules_create_namespace
    depends_on       = [var.alertrules_chart_depends_on]
    values = [
      templatefile("${path.module}/${var.alertrules_chart_template}",
        {
          alertrules_namespace = var.alertrules_namespace
        }
      )
    ]
}