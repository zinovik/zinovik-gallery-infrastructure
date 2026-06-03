resource "google_cloud_run_service_iam_member" "gallery_api_run_function_invoker" {
  project  = var.project_id
  location = var.region
  service  = "gallery-api"

  role   = "roles/run.invoker"
  member = "serviceAccount:cloud-scheduler-invoker@${var.project_id}.iam.gserviceaccount.com"
}
