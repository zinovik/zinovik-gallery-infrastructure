resource "google_firestore_database" "gallery" {
  project     = var.project_id
  name        = "gallery-db"
  location_id = "europe-central2"
  type        = "FIRESTORE_NATIVE"
}
