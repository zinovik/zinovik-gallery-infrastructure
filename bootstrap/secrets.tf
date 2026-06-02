
resource "google_secret_manager_secret" "gallery_api_jwt_secret" {
  secret_id = "gallery-api-jwt-secret"

  labels = {
    environment = "production"
  }

  replication {
    auto {}
  }
}
