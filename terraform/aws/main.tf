terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    local = {
      source = "hashicorp/local"
      version  = "~> 2.0"
    }
    helm = {
      source = "hashicorp/helm"
      version  = "~> 2.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

provider "helm" {
  alias  = "helm"
  kubernetes {
    host                   = module.eks.kubernetes_host
    cluster_ca_certificate = module.eks.kubernetes_ca_certificate
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["--region", "${var.region}", "eks", "get-token", "--cluster-name", "${var.building_block}-${var.env}-eks"]
    }
  }
}

module "vpc" {
  source         = "../modules/aws/vpc"
}

module "eks" {
  source                = "../modules/aws/eks"
  eks_master_subnet_ids = module.vpc.multi_zone_public_subnets_ids
  eks_nodes_subnet_ids  = module.vpc.single_zone_public_subnets_id
  eks_master_role       = "keshav_eks_master_role"
  eks_nodes_role        = "keshav_eks_nodes_role"
}

module "iam" {
  source         = "../modules/aws/iam"
}

module "s3" {
  source         = "../modules/aws/s3"
}

module "promtail" {
  source                    = "../modules/helm/promtail"
  promtail_chart_depends_on = [module.loki]
}

module "loki" {
  source                    = "../modules/helm/loki"
  depends_on                = [module.eks]
}

module "monitoring" {
  source          = "../modules/helm/monitoring"
}

module "superset" {
  source                            = "../modules/helm/superset"
  postgresql_admin_username         = module.postgresql.postgresql_admin_username
  postgresql_admin_password         = module.postgresql.postgresql_admin_password
  postgresql_superset_user_password = module.postgresql.postgresql_superset_user_password
  superset_chart_depends_on         = [module.postgresql]
}

module "grafana_configs" {
  source                           = "../modules/helm/grafana_configs"
  grafana_configs_chart_depends_on = [module.monitoring]
}

module "postgresql" {
  source               = "../modules/helm/postgresql"
  depends_on           = [module.eks]
}

module "kafka" {
  source         = "../modules/helm/kafka"
  depends_on     = [module.eks]
}

module "flink" {
  source                         = "../modules/helm/flink"
  flink_container_registry       = var.flink_container_registry
  flink_image_tag                = var.flink_image_tag
  s3_access_key                  = module.iam.s3_access_key
  s3_secret_key                  = module.iam.s3_secret_key
  flink_checkpoint_store_type    = var.flink_checkpoint_store_type
  flink_chart_depends_on         = [module.kafka]
  postgresql_flink_user_password = module.postgresql.postgresql_flink_user_password
}

module "druid_raw_cluster" {
  source                             = "../modules/helm/druid_raw_cluster"
  s3_access_key                      = module.iam.s3_access_key
  s3_secret_key                      = module.iam.s3_secret_key
  s3_bucket                          = module.s3.s3_bucket
  druid_deepstorage_type             = var.druid_deepstorage_type
  druid_raw_cluster_chart_depends_on = [module.postgresql, module.druid_operator]
  kubernetes_storage_class           = var.kubernetes_storage_class
  druid_raw_user_password            = module.postgresql.postgresql_druid_raw_user_password
}

module "druid_operator" {
  source          = "../modules/helm/druid_operator"
  depends_on      = [module.eks]
}

module "kafka_exporter" {
  source                          = "../modules/helm/kafka_exporter"
  kafka_exporter_chart_depends_on = [module.kafka, module.monitoring]
}

module "postgresql_exporter" {
  source                               = "../modules/helm/postgresql_exporter"
  postgresql_exporter_chart_depends_on = [module.postgresql, module.monitoring]
}

module "druid_exporter" {
  source                          = "../modules/helm/druid_exporter"
  druid_exporter_chart_depends_on = [module.druid_raw_cluster, module.monitoring]
}

module "dataset_api" {
  source                             = "../modules/helm/dataset_api"
  dataset_api_container_registry     = var.dataset_api_container_registry
  dataset_api_image_tag              = var.dataset_api_image_tag
  dataset_api_postgres_user_password = module.postgresql.postgresql_dataset_api_user_password
  dataset_api_chart_depends_on       = [module.postgresql, module.kafka]
}

module "secor" {
  source                  = "../modules/helm/secor"
  secor_chart_depends_on  = [module.kafka]
}

module "submit_ingestion" {
  source                            = "../modules/helm/submit_ingestion"
  submit_ingestion_chart_depends_on = [module.kafka, module.druid_raw_cluster]
}

module "alert_rules" {
  source                  = "../modules/helm/alert_rules"
  secor_chart_depends_on  = [module.monitoring]
}