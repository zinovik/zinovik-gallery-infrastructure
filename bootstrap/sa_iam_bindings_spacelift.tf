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

resource "google_project_iam_member" "spacelift_cloudscheduler_admin" {
  project = var.project_id
  role    = "roles/cloudscheduler.admin"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_project_iam_member" "spacelift_cloud_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_service_account" "cloud_scheduler_invoker" {
  account_id   = "cloud-scheduler-invoker"
  display_name = "Project Service Account"
}

resource "google_service_account_iam_member" "spacelift_act_as_sa" {
  service_account_id = google_service_account.cloud_scheduler_invoker.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.spacelift_service_account_email}"
}
