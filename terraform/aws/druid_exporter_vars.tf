variable "druid_exporter_release_name" {
    type        = string
    description = "Druid exporter helm release name."
    default     = "druid-exporter"
}

variable "druid_exporter_namespace" {
    type        = string
    description = "Druid exporter namespace."
    default     = "druid-raw"
}

variable "druid_exporter_chart_path" {
    type        = string
    description = "Druid exporter chart path."
    default     = "../../helm_charts/druid-exporter"
}

# variable "druid_exporter_chart_install_timeout" {
#     type        = number
#     description = "Druid exporter chart install timeout."
#     default     = 600
# }

variable "druid_exporter_create_namespace" {
    type        = bool
    description = "Create druid exporter namespace."
    default     = true
}

variable "druid_exporter_wait_for_jobs" {
    type        = bool
    description = "Druid exporter wait for jobs paramater."
    default     = true
}

variable "druid_exporter_chart_template" {
    type = string
    default = "../../helm_charts/druid-exporter/values.yaml"
    
}

# variable "env" {
#     type        = string
#     description = "Environment name. All resources will be prefixed with this value."
#     default     = "dev"
# }