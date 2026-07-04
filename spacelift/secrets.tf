data "google_secret_manager_secret" "gallery_api_jwt_secret" {
  secret_id = "gallery-api-jwt-secret"
  project   = var.project_id
}

resource "google_secret_manager_secret_version" "gallery_api_jwt_secret" {
  secret      = data.google_secret_manager_secret.gallery_api_jwt_secret.id
  secret_data = var.gallery_api_jwt_secret
}

data "google_secret_manager_secret" "gallery_api_mongo_uri" {
  secret_id = "gallery-api-mongo-uri"
  project   = var.project_id
}

resource "google_secret_manager_secret_version" "gallery_api_mongo_uri" {
  secret      = data.google_secret_manager_secret.gallery_api_mongo_uri.id
  secret_data = var.gallery_api_mongo_uri
}
