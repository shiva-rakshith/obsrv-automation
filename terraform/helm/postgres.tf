resource "helm_release" "postgres" {
    name              = var.postgresql_release_name
    repository        = var.postgresql_chart_repository
    chart             = var.postgresql_chart_name
    version           = var.postgresql_chart_version
    timeout           = var.postgresql_chart_install_timeout
    namespace         = var.postgresql_namespace
    create_namespace  = var.postgresql_create_namespace
    dependency_update = var.postgresql_chart_dependecy_update

    values = [
      file(var.postgresql_chart_template)
    ]
}