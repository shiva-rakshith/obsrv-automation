variable "env" {
    type        = string
    description = "Environment name. All resources will be prefixed with this value."
    default     = "dev"
}

variable "building_block" {
    type        = string
    description = "Building block name. All resources will be prefixed with this value."
    default     = "obsrv"
}

variable "region" {
    type        = string
    description = "AWS region to create the resources."
    default     = "us-east-2"
}

variable "vpc_cidr" {
    type        = string
    description = "VPC CIDR range"
    default     = "10.10.0.0/16"
}

variable "vpc_instance_tenancy" {
    type        = string
    description = "VPC tenancy type."
    default     = "default"
}

variable "additional_tags" {
    type        = map(string)  
    description = "Additional tags for the resources. These tags will be applied to all the resources."
    default     = {}
}

variable "availability_zones" {
    type        = list(string)
    description = "AWS Availability Zones."
    default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnet_cidrs" {
    type        = list(string)
    description = "Public subnet CIDR values."
    default     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

variable "auto_assign_public_ip" {
    type        = bool
    description = "Auto assign public ip's to instances in this subnet"
    default     = true
}

variable "igw_cidr" {
    type        = string
    description = "Internet gateway CIDR range."
    default     = "0.0.0.0/0"
}

variable "eks_master_role" {
    type        = string
    description = "EKS control plane role name."
    default     = "eks_master_role"
}

variable "eks_nodes_role" {
    type        = string
    description = "EKS data plane role name.."
    default     = "eks_nodes_role"
}

variable "node_group_name" {
    type        = string
    description = "EKS node group name.."
    default     = "eks_spot_node_group"
}

variable "eks_node_group_ami_type" {
    type        = string
    description = "EKS node group AMI type."
    default     = "AL2_x86_64"
}

variable "eks_node_group_instance_type" {
    type        = list(string)
    description = "EKS nodegroup instance types."
    default     = ["t3a.large"]
}

variable "eks_node_group_capacity_type" {
    type        = string
    description = "EKS node group type. Either SPOT or ON_DEMAND can be used"
    default     = "SPOT"
}

variable "eks_node_group_scaling_config" {
    type        = map(number)
    description = "EKS node group auto scaling configuration."
    default = {
      desired_size = 3
      max_size   = 3
      min_size   = 1
    }
}

variable "eks_version" {
    type        = string
    description = "EKS version."
    default     = "1.24"
}

variable "eks_addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "kube-proxy"
      version = "v1.24.9-eksbuild.1"
    },
    {
      name    = "vpc-cni"
      version = "v1.12.1-eksbuild.1"
    },
    {
      name    = "coredns"
      version = "v1.8.7-eksbuild.3"
    },
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.14.1-eksbuild.1"
    }
  ]
}

variable "kubernetes_storage_class" {
    type        = string
    description = "Storage class name for the EKS cluster"
    default     = "gp2"
}

variable "postgres_release_name" {
    type        = string
    description = "Postgresql helm release name."
    default     = "postgresql"
}

variable "postgres_namespace" {
    type        = string
    description = "Postgresql namespace."
    default     = "postgresql"
}

variable "postgresql_chart_path" {
    type        = string
    description = "Postgresql chart path."
    default     = "../../helm_charts/postgresql"
}

variable "postgresql_chart_install_timeout" {
    type        = number
    description = "Postgresql chart install timeout."
    default     = 600
}

variable "postgresql_create_namespace" {
    type        = bool
    description = "Create postgresql namespace."
    default     = true
}

variable "postgresql_chart_template" {
    type        = string
    description = "Postgresql chart custom values.yaml path."
    default     = "../terraform_helm_templates/postgres.yaml.tfpl"
}

variable "postgresql_chart_dependecy_update" {
    type        = bool
    description = "Postgresql chart dependency update."
    default     = true
}


variable "druid_operator_release_name" {
    type        = string
    description = "Druid operator helm release name."
    default     = "druid-operator"
}

variable "druid_operator_namespace" {
    type        = string
    description = "Druid operator namespace."
    default     = "druid-raw"
}

variable "druid_operator_chart_path" {
    type        = string
    description = "Druid operator chart path."
    default     = "../../helm_charts/druid-operator"
}

variable "druid_operator_chart_install_timeout" {
    type        = number
    description = "Druid operator chart install timeout."
    default     = 600
}

variable "druid_operator_create_namespace" {
    type        = bool
    description = "Create druid operator namespace."
    default     = true
}

variable "druid_operator_wait_for_jobs" {
    type        = bool
    description = "Druid operator wait for jobs paramater."
    default     = true
}

variable "druid_cluster_release_name" {
    type        = string
    description = "Druid cluster helm release name."
    default     = "druid-cluster"
}

variable "druid_namespace" {
    type        = string
    description = "Druid namespace."
    default     = "druid-raw"
}

variable "druid_cluster_chart_path" {
    type        = string
    description = "Druid cluster chart path."
    default     = "../../helm_charts/druid-cluster"
}

variable "druid_cluster_chart_install_timeout" {
    type        = number
    description = "Druid cluster chart install timeout."
    default     = 3000
}

variable "druid_cluster_create_namespace" {
    type        = bool
    description = "Create druid cluster namespace."
    default     = true
}

variable "druid_cluster_wait_for_jobs" {
    type        = bool
    description = "Druid cluster wait for jobs paramater."
    default     = true
}

variable "druid_cluster_chart_template" {
    type        = string
    description = "Druid cluster chart values.yaml path."
    default     = "../terraform_helm_templates/druid_cluster.yaml.tfpl"
}

variable "druid_user" {
    type        = string
    description = "Druid user name."
    default     = "druid"
}

variable "druid_password" {
    type        = string
    description = "Druid password."
    default     = "druid"
}

variable "druid_worker_capacity" {
    type        = number
    description = "Druid middle manager worker capacity."
    default     = 2
}

variable "kafka_release_name" {
    type        = string
    description = "Kafka helm release name."
    default     = "kafka"
}

variable "kafka_namespace" {
    type        = string
    description = "Kafka namespace."
    default     = "kafka"
}

variable "kafka_chart_path" {
    type        = string
    description = "Kafka chart path."
    default     = "../../helm_charts/kafka"
}

variable "kafka_chart_install_timeout" {
    type        = number
    description = "Kafka chart install timeout."
    default     = 3000
}

variable "kafka_create_namespace" {
    type        = bool
    description = "Create kafka namespace."
    default     = true
}

variable "kafka_wait_for_jobs" {
    type        = bool
    description = "Kafka wait for jobs paramater."
    default     = true
}

variable "kafka_chart_custom_values_yaml" {
    type        = string
    description = "Kafka chart values.yaml path."
    default     = "../../helm_charts/kafka/values.yaml"
}

variable "kafka_chart_dependecy_update" {
    type        = bool
    description = "Kafka chart dependency update."
    default     = true
}

variable "kafka_input_topic" {
    type        = string
    description = "Kafka input topic."
    default     = "telemetry.denorm"
}

variable "kafka_output_telemetry_route_topic" {
    type        = string
    description = "Kafka output telemetry route topic"
    default     = "druid.events.telemetry"
}

variable "kafka_output_summary_route_topic" {
    type        = string
    description = "Kafka output summary route topic"
    default     = "druid.events.summary"
}

variable "kafka_output_failed_topic" {
    type        = string
    description = "Kafka output failed topic"
    default     = "telemetry.failed"
}

variable "kafka_output_duplicate_topic" {
    type        = string
    description = "Kafka output duplicate topic"
    default     = "telemetry.duplicate"
}
variable "superset_release_name" {
    type        = string
    description = "Superset helm release name."
    default     = "superset"
}

variable "superset_namespace" {
    type        = string
    description = "Superset namespace."
    default     = "superset"
}

variable "superset_chart_path" {
    type        = string
    description = "Superset chart path."
    default     = "../../helm_charts/superset-helm"
}

variable "superset_chart_install_timeout" {
    type        = number
    description = "Superset chart install timeout."
    default     = 3000
}

variable "superset_create_namespace" {
    type        = bool
    description = "Create superset namespace."
    default     = true
}

variable "superset_wait_for_jobs" {
    type        = bool
    description = "Superset wait for jobs paramater."
    default     = true
}

variable "superset_chart_custom_values_yaml" {
    type        = string
    description = "Superset chart values.yaml path."
    default     = "../../helm_charts/superset-helm/values.yaml"
}

variable "flink_release_name" {
    type        = string
    description = "Flink helm release name."
    default     = "druid-validator"
}

variable "flink_namespace" {
    type        = string
    description = "Flink namespace."
    default     = "flink"
}

variable "flink_chart_path" {
    type        = string
    description = "Flink chart path."
    default     = "../../helm_charts/flink"
}

variable "flink_chart_install_timeout" {
    type        = number
    description = "Flink chart install timeout."
    default     = 900
}

variable "flink_create_namespace" {
    type        = bool
    description = "Create flink namespace."
    default     = true
}

variable "flink_wait_for_jobs" {
    type        = bool
    description = "Flink wait for jobs paramater."
    default     = false
}

variable "flink_chart_template" {
    type        = string
    description = "Flink chart values.yaml path."
    default     = "../terraform_helm_templates/flink.yaml.tfpl"
}

variable "flink_kubernetes_service_name" {
    type        = string
    description = "Flink kubernetes service name."
    default     = "druid-validator-jobmanager"
}

variable "druid_deepstorage_type" {
    type        = string
    description = "Druid deep strorage."
    default     = "s3"
}

variable "flink_checkpoint_store_type" {
    type        = string
    description = "Flink checkpoint store type."
    default     = "s3"
}