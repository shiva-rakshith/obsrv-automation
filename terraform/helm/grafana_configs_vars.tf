variable "grafana_configs_release_name" {
    type        = string
    description = "Grafana configs helm release name."
    default     = "grafana-configs"
}

variable "grafana_configs_namespace" {
    type        = string
    description = "Grafana configs namespace."
    default     = "monitoring"
}

variable "grafana_configs_chart_path" {
    type        = string
    description = "Grafana configs chart path."
    default     = "../../helm_charts/grafana-configs"
}

variable "grafana_configs_chart_install_timeout" {
    type        = number
    description = "Grafana configs chart install timeout."
    default     = 900
}

variable "grafana_configs_wait_for_jobs" {
    type        = bool
    description = "Grafana configs wait for jobs paramater."
    default     = false
}