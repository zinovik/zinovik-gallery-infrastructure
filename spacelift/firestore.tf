resource "google_firestore_database" "gallery" {
  project     = var.project_id
  name        = "gallery-db"
  location_id = "europe-central2"
  type        = "FIRESTORE_NATIVE"
}

resource "google_firestore_field" "gallery_expires_at_ttl" {
  project    = var.project_id
  database   = google_firestore_database.gallery.name
  collection = "signed-urls"
  field      = "expiresAt"

  ttl_config {}
}
