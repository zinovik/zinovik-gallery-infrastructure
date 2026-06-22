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

# Firestore access

resource "google_project_iam_member" "gallery_api_firestore_user" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${google_service_account.gallery_api.email}"
}

resource "google_project_iam_member" "storage_tools_firestore_user" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:storage-tools@zinovik-project.iam.gserviceaccount.com"
}
