variable "postgresql_exporter_release_name" {
    type        = string
    description = "Postgres exporter helm release name."
    default     = "postgresql-exporter"
}

variable "postgresql_exporter_namespace" {
    type        = string
    description = "Postgres exporter namespace."
    default     = "postgresql"
}

variable "postgresql_exporter_chart_path" {
    type        = string
    description = "Postgresql exporter chart path."
    default     = "../../helm_charts/postgresql-exporter"
}

variable "postgresql_exporter_create_namespace" {
    type        = bool
    description = "Create postgresql exporter namespace."
    default     = true
}

variable "postgresql_exporter_wait_for_jobs" {
    type        = bool
    description = "Postgresql exporter wait for jobs paramater."
    default     = true
}

variable "postgresql_exporter_chart_template" {
    type = string
    default = "../../helm_charts/postgresql-exporter/values.yaml"
    
}