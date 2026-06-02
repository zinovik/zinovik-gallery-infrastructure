variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "zinovik-gallery"
}

variable "project_number" {
  description = "GCP Project Number"
  type        = string
  default     = "676750851465"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-central2"
}

variable "oidc_issuer" {
  description = "OIDC issuer URL"
  type        = string
  default     = "https://zinovik.app.spacelift.io"
}

variable "spacelift_repository" {
  description = "Spacelift repository name"
  type        = string
  default     = "zinovik/zinovik-gallery-infrastructure"
}

variable "stack" {
  description = "Stack name"
  type        = string
  default     = "zinovik-gallery"
}

variable "allowed_github_repos" {
  description = "List of allowed GitHub repositories for workload identity"
  type        = list(string)
  default     = ["zinovik/gallery-api"]
}

variable "spacelift_service_account_email" {
  description = "Spacelift service account email"
  type        = string
}
