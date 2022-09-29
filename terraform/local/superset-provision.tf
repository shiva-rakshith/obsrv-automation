resource "helm_release" "one_click_superset" {
  name             = "one-click-superset"
  chart            = "../../helm_charts/superset-helm"
  namespace        = var.SUPERSET_NAMESPACE
  create_namespace = true
  depends_on       = [helm_release.druid_cluster]
  wait_for_jobs    = true
  values           = [
    templatefile("../../helm_charts/superset-helm/values.yaml",
      {}
    )
  ]
}
