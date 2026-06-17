resource "google_storage_bucket" "gallery-files" {
  name     = "gallery-files"
  location = "europe-central2"

  versioning {
    enabled = false
  }

  cors {
    origin          = ["https://zinovik.github.io", "http://localhost:3000"]
    method          = ["GET"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }

  autoclass {
    enabled = true
  }

  soft_delete_policy {
    retention_duration_seconds = 0 # clear soft delete
  }
}

# Permissions for other projects

resource "google_storage_bucket_iam_member" "storage_tools_object_admin" {
  bucket = google_storage_bucket.gallery-files.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:storage-tools@zinovik-project.iam.gserviceaccount.com"
}

resource "google_storage_bucket_iam_member" "fuftyfu_api_object_viewer" {
  bucket = google_storage_bucket.gallery-files.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:fuftyfu@zinovik-project.iam.gserviceaccount.com"
}

resource "google_storage_bucket_iam_member" "fuftyfu_api_object_creator" {
  bucket = google_storage_bucket.gallery-files.name
  role   = "roles/storage.objectCreator"
  member = "serviceAccount:fuftyfu@zinovik-project.iam.gserviceaccount.com"
}

resource "google_service_account_iam_member" "fuftyfu_api_token_creator" {
  service_account_id = "projects/zinovik-project/serviceAccounts/fuftyfu@zinovik-project.iam.gserviceaccount.com"
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "serviceAccount:fuftyfu@zinovik-project.iam.gserviceaccount.com"
}
