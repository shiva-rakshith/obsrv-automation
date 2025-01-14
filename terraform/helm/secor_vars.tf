variable "secor_release_name" {
    type        = string
    description = "Secor helm release name."
    default     = "secor"
}

variable "secor_image_tag" {
    type        = string
    description = "secor image version"
    default     = "0.29.1"
}

variable "jobs" {
  description = "Create release names"
  type        = list(string)
  default     = [
  "ingest-backup", "extractor-duplicate-backup", 
  "extractor-failed-backup", "raw-backup", 
  "failed-backup", "invalid-backup", 
  "unique-backup", "duplicate-backup", 
  "denorm-backup", "denorm-failed-backup", 
  "transform-backup", "system-stats",
  "system-events"
  ]
}

variable "secor_image_repository" {
    type        = string
    description = "secor image version"
    default     = "manjudr/secor"
}

variable "secor_namespace" {
    type        = string
    description = "Secor namespace."
    default     = "secor"
}

variable "secor_chart_path" {
    type        = string
    description = "Secor chart path."
    default     = "../../helm_charts/secor"
}

variable "secor_chart_install_timeout" {
    type        = number
    description = "Secor chart install timeout."
    default     = 3001
}

variable "secor_create_namespace" {
    type        = bool
    description = "Create secor namespace."
    default     = true
}

variable "secor_wait_for_jobs" {
    type        = bool
    description = "Secor wait for jobs paramater."
    default     = true
}

variable "secor_chart_custom_values_yaml" {
    type        = string
    description = "Secor chart values.yaml path."
    default     = "../../helm_charts/secor/values.yaml"
}

variable "secor_chart_dependecy_update" {
    type        = bool
    description = "Kafka chart dependency update."
    default     = true
}


variable "secor_threads_count" {
    type        = number
    description = "Secor process number of threads."
    default     = 2
}

variable "secor_cpu_request" {
    type        = string
    description = "Secor CPU Request"
    default     = "128m"
}

variable "secor_memory_request" {
    type        = string
    description = "Secor Memory Request"
    default     = "512Mi"
}

variable "secor_cpu_limit" {
    type        = string
    description = "Secor CPU limit"
    default     = "128m"
}

variable "secor_memory_limit" {
    type        = string
    description = "Secor Memory limit"
    default     = "512Mi"
}

variable "secor_backup_interval" {
    type        = number
    description = "Secor backup interval"
    default     = 1000  # In seconds
}

variable "secor_backup_max_file_size" {
    type        = number
    description = "Secor backup max file size"
    default     = 100000000  # In bytes
}

variable "secor_backup_basepath" {
    type        = string
    description = "Secor backup base path"
    default     = "/telemetry-data"
}

variable "secor_backup_pv_size" {
    type        = string
    description = "secor backup pv size"
    default     = "1Gi" 
}

variable "kafka_broker_ip" {
    type        = string
    description = "Kafka broker address"
    default     = "kafka-headless.kafka.svc.cluster.local"
}

variable "kafka_zookeeper_ip" {
    type        = string
    description = "Kafka zookeeper address"
    default     = "kafka-zookeeper-headless.kafka.svc.cluster.local:2181"  
}

variable "cloud_storage_bucket" {
    type        = string
    description = "Cloud storage bucket"
    default     = "telemetry-data-store"  
}

variable "secor_chart_template" {
    type = string
    default = "../../helm_charts/secor/values.yaml"
    
}
