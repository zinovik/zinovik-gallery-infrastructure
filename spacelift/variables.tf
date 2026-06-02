variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "zinovik-gallery"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-central2"
}

variable "gallery_api_jwt_secret" {
  description = "JWT secret for Gallery API"
  type        = string
}
