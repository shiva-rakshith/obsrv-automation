variable "superset_charts_release_name" {
    type        = string
    description = "superset_charts helm release name."
    default     = "superset_charts"
}

variable "superset_charts_namespace" {
    type        = string
    description = "superset_charts_charts namespace."
    default     = "superset-charts"
}

variable "superset_charts_chart_path" {
    type        = string
    description = "superset_charts chart path."
    default     = "../../helm_charts/superset-charts"
}

variable "superset_charts_chart_install_timeout" {
    type        = number
    description = "superset_charts chart install timeout."
    default     = 3000
}

variable "superset_charts_create_namespace" {
    type        = bool
    description = "Create superset_charts namespace."
    default     = true
}

variable "superset_charts_wait_for_jobs" {
    type        = bool
    description = "superset_charts wait for jobs paramater."
    default     = true
}

variable "superset_charts_chart_custom_values_yaml" {
    type        = string
    description = "superset_charts chart values.yaml path."
    default     = "../../helm_charts/superset-charts/values.yaml"
}