variable "api_release_name" {
    type        = string
    description = "api helm release name."
    default     = "dataset-api"
}

variable "api_namespace" {
    type        = string
    description = "api namespace."
    default     = "dataset-service-dev"
}

variable "api_chart_path" {
    type        = string
    description = "api chart path."
    default     = "../../helm_charts/dataset-service"
}

variable "api_create_namespace" {
    type        = bool
    description = "Create api namespace."
    default     = true
}

variable "api_chart_template" {
    type = string
    default = "../../helm_charts/dataset-service/values.yaml"
    
}