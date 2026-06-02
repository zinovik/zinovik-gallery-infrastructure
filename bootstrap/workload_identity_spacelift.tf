resource "google_iam_workload_identity_pool" "spacelift_pool" {
  workload_identity_pool_id = "spacelift-pool"
  display_name              = "Spacelift Pool"
}

resource "google_iam_workload_identity_pool_provider" "spacelift_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.spacelift_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "spacelift-provider"

  display_name = "Spacelift OIDC Provider"

  oidc {
    issuer_uri = var.oidc_issuer
  }

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    "attribute.stack"      = "assertion.stack"
    "attribute.workspace"  = "assertion.workspace"
  }

  attribute_condition = <<EOT
    assertion.aud == "google" &&
    assertion.repository == "${var.spacelift_repository}" &&
    assertion.stack == "${var.stack}"
  EOT
}
