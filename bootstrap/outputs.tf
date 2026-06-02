output "project_id" {
  value = var.project_id
}

output "github_service_account_email" {
  value = google_service_account.github.email
}

output "spacelift_workload_identity_provider" {
  value = google_iam_workload_identity_pool_provider.spacelift_provider.name
}

output "github_workload_identity_provider" {
  value = google_iam_workload_identity_pool_provider.github_provider.name
}
