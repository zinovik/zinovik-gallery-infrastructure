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

resource "google_service_account_iam_member" "spacelift_act_as_appengine_sa" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.project_id}@appspot.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.spacelift_service_account_email}"
}
