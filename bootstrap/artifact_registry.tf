resource "google_artifact_registry_repository" "zinovik_repository" {
  location      = var.region
  repository_id = "zinovik-repository"
  description   = "Docker repository for zinovik-gallery"
  format        = "DOCKER"
  project       = var.project_id
}
