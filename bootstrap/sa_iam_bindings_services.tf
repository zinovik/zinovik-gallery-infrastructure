resource "google_service_account" "gallery_api" {
  account_id   = "gallery-api"
  display_name = "Gallery API Service Account"
}

#

resource "google_secret_manager_secret_iam_member" "gallery_api_jwt_secret_accessor" {
  secret_id = google_secret_manager_secret.gallery_api_jwt_secret.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.gallery_api.email}"
}
