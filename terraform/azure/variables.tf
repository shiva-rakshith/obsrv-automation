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

variable "superset_image_tag" {
  type        = string
  description = "Superset image tag"
  default     = "2.0.0"
}

variable "postgresql_image_tag" {
  type = string
  description = "Postgresql image tag."
  default = "14.5.0-debian-11-r14"
}

variable "flink_image_tag" {
   type        = string
   description = "Flink kubernetes service name."
   default     = "2.1"
}

variable "kubernetes_storage_class" {
    type        = string
    description = "Storage class name for the AKS cluster"
    default     = "default"
}

variable "druid_deepstorage_type" {
    type        = string
    description = "Druid deep strorage type."
    default     = "azure"
}

variable "flink_checkpoint_store_type" {
    type        = string
    description = "Flink checkpoint store type."
    default     = "azure"
}