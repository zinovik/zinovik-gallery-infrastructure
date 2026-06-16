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

# Permission for old api service account, will be removed

resource "google_storage_bucket_iam_member" "gallery_files_viewer" {
  bucket = google_storage_bucket.gallery-files.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:gallery@zinovik-project.iam.gserviceaccount.com"
}
