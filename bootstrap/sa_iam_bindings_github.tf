resource "google_service_account" "github" {
  account_id   = "github"
  display_name = "GitHub Deployment Service Account"
}

resource "google_service_account_iam_member" "github_workload_identity_user" {
  service_account_id = google_service_account.github.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_pool.workload_identity_pool_id}/attribute.ref/refs/heads/main"
}

resource "google_project_iam_member" "github_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_sa_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_artifact_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_cloudbuild_editor" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.editor"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_service_usage_consumer" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageConsumer"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_logging_viewer" {
  project = var.project_id
  role    = "roles/logging.viewer"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_viewer" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.github.email}"
}
