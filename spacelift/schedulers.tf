resource "google_cloud_scheduler_job" "gallery_update_sources_config" {
  name     = "gallery-update-sources-config"
  project  = var.project_id
  schedule = "0 0 * * 1"

  http_target {
    uri         = "https://gallery-api-278546267214.europe-central2.run.app/edit/update-sources-config"
    http_method = "POST"

    oidc_token {
      service_account_email = "gallery-api@zinovik-gallery.iam.gserviceaccount.com"
      audience              = "https://gallery-api-278546267214.europe-central2.run.app/edit/update-sources-config"
    }
  }
}
