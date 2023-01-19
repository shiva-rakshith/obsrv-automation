resource "helm_release" "druid_cluster" {
    name             = var.druid_cluster_release_name
    chart            = var.druid_cluster_chart_path
    timeout          = var.druid_cluster_chart_install_timeout
    namespace        = var.druid_cluster_namespace
    create_namespace = var.druid_cluster_create_namespace
    depends_on       = [helm_release.druid_operator, helm_release.postgres]
    wait_for_jobs    = var.druid_cluster_wait_for_jobs
    values = [
      templatefile(var.druid_cluster_chart_custom_values_yaml,
        {
          druid_namespace = var.druid_cluster_namespace
          druid_user  = var.druid_user_name
          druid_password  = var.druid_password
          druid_worker_capacity = var.druid_worker_capacity
          deployment_stage = var.env
          storage_class_name = var.eks_storage_class
        }
      )
    ]
}


