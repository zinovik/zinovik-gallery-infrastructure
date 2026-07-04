
resource "google_secret_manager_secret" "gallery_api_jwt_secret" {
  secret_id = "gallery-api-jwt-secret"

  labels = {
    environment = "production"
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "gallery_api_mongo_uri" {
  secret_id = "gallery-api-mongo-uri"

  labels = {
    environment = "production"
  }

  replication {
    auto {}
  }
}
