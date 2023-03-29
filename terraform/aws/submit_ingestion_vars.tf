variable "submit_ingestion_release_name" {
    type        = string
    description = "Kafka helm release name."
    default     = "submit-ingestion"
}

variable "submit_ingestion_namespace" {
    type        = string
    description = "Kafka namespace."
    default     = "druid-raw"
}

variable "submit_ingestion_chart_path" {
    type        = string
    description = "Kafka chart path."
    default     = "../../helm_charts/submit-ingestion"
}

variable "submit_ingestion_chart_install_timeout" {
    type        = number
    description = "Submit ingestion chart install timeout."
    default     = 3000
}

variable "submit_ingestion_create_namespace" {
    type        = bool
    description = "Create submit_ingestion namespace."
    default     = true
}

variable "submit_ingestion_wait_for_jobs" {
    type        = bool
    description = "Kafka wait for jobs paramater."
    default     = true
}

variable "submit_ingestion_chart_custom_values_yaml" {
    type        = string
    description = "Kafka chart values.yaml path."
    default     = "../../helm_charts/submit-ingestion/values.yaml"
}

variable "submit_ingestion_chart_dependecy_update" {
    type        = bool
    description = "submit ingestion chart dependency update."
    default     = true
}