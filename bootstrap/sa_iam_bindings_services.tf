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

resource "google_secret_manager_secret_iam_member" "gallery_api_mongo_uri" {
  secret_id = google_secret_manager_secret.gallery_api_mongo_uri.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.gallery_api.email}"
}


resource "google_storage_bucket_iam_member" "gallery_api_object_viewer" {
  bucket = google_storage_bucket.gallery-files.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.gallery_api.email}"
}

resource "google_service_account_iam_member" "gallery_api_token_creator" {
  service_account_id = google_service_account.gallery_api.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "serviceAccount:${google_service_account.gallery_api.email}"
}
