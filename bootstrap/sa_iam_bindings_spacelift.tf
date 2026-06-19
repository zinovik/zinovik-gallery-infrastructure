resource "google_project_iam_member" "spacelift_browser" {
  project = var.project_id
  role    = "roles/browser"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_project_iam_member" "spacelift_secret_admin" {
  project = var.project_id
  role    = "roles/secretmanager.admin"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_project_iam_member" "spacelift_cloud_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_project_iam_member" "spacelift_firestore_owner" {
  project = var.project_id
  role    = "roles/datastore.owner"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}
