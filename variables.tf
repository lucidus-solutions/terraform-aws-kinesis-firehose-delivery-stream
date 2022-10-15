variable "access_key" {
  type        = string
  description = ""
  sensitive   = true
}
variable "app" {
  type        = string
  description = "The name of the application or project that the stack supports"
  sensitive   = false
}

variable "buffer_interval" {
  type      = number
  default   = 60
  sensitive = false
}

variable "buffer_size" {
  type      = number
  default   = 1
  sensitive = false
}

variable "compression_format" {
  type      = string
  default   = "GZIP"
  sensitive = false
}

variable "content_encoding" {
  type      = string
  default   = "GZIP"
  sensitive = false
}

variable "destination" {
  type        = string
  description = ""
  default     = "http_endpoint"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "The target environment for the stack - could be a tier or account level reference"
  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "demo", "perf", "nonprod", "prod"], var.env)
    error_message = "Must be one of the following: dev, qa, stage, prod, demo, perf,nonprod, prod"
  }
  sensitive = false
}

variable "http_endpoint_name" {
  type        = string
  description = "New Relic"
  default     = "value"
  sensitive   = false
}

variable "program" {
  type        = string
  description = "The name of the program that the application or project belongs to"
  sensitive   = false
}

variable "role_arn" {
  type = string
}

variable "s3_backup_mode" {
  type      = string
  default   = "FailedDataOnly"
  sensitive = false
}

variable "s3_bucket_arn" {
  type      = string
  sensitive = false
}

variable "url" {
  type        = string
  description = ""
  default     = "https://gov-metric-api.newrelic.com/metric/v1"
  sensitive   = false
}
