
resource "helm_release" "postgres" {
  chart = "https://charts.bitnami.com/bitnami/postgresql-11.9.1.tgz"
  name = "postgresql"
  timeout = 600
  namespace = "postgres"
  create_namespace = true
  depends_on = [kind_cluster.one-click]

  values = [
    file("${path.module}/postgresql/custom-values.yaml")
  ]
}