variable "alertrules_release_name" {
    type        = string
    description = "alertrules helm release name."
    default     = "alertrules"
}

variable "alertrules_namespace" {
    type        = string
    description = "alertrules namespace."
    default     = "monitoring"
}

variable "alertrules_chart_path" {
    type        = string
    description = "alertrules chart path."
    default     = "../../helm_charts/alert-rules"
}

variable "alertrules_create_namespace" {
    type        = bool
    description = "Create alertrules namespace."
    default     = true
}

variable "alertrules_chart_template" {
    type = string
    default = "../../helm_charts/alert-rules/values.yaml"
    
}