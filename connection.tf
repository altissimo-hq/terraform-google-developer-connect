# Create a Developer Connect Connection to GitHub using a Token from Secret Manager
resource "google_developer_connect_connection" "github" {
  provider      = google-beta
  project       = var.project
  location      = local.region
  connection_id = var.connection_id

  github_config {
    github_app          = var.github_app
    app_installation_id = var.github_app_installation_id

    authorizer_credential {
      oauth_token_secret_version = local.oauth_token_secret_version
    }
  }
}

# Retrieve the Service Identity for the Developer Connect service agent (P4SA)
resource "google_project_service_identity" "developer_connect" {
  provider = google-beta
  project  = var.project
  service  = "developerconnect.googleapis.com"
}
