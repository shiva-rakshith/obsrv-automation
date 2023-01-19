resource "helm_release" "postgres" {
    name              = var.postgres_release_name
    chart             = var.postgresql_chart_path
    timeout           = var.postgresql_chart_install_timeout
    namespace         = var.postgres_namespace
    create_namespace  = var.postgresql_create_namespace
    dependency_update = var.postgresql_chart_dependecy_update

    values = [
      file(var.postgresql_chart_custom_values_yaml)
    ]
}