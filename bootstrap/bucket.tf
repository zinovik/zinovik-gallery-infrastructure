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
}

resource "google_storage_bucket" "gallery-data" {
  name     = "gallery-data"
  location = "europe-central2"

  versioning {
    enabled = true
  }
}
