# Create the Secret Manager Secret, if create_secret is true
resource "google_secret_manager_secret" "github_auth_token" {
  count     = var.create_secret ? 1 : 0
  project   = local.secret_project
  secret_id = var.oauth_token_secret

  replication {
    auto {}
  }

  labels = {
    created-by       = "terraform"
    publisher        = "altissimo-hq"
    terraform-module = "terraform-google-developer-connect"
    service          = "github"
    type             = "oauth-token"
  }
}

# Grant the Developer Connect Service Agent access to the Secret Manager Secret
resource "google_secret_manager_secret_iam_member" "developer_connect_github_auth_token" {
  count     = var.create_secret ? 1 : 0
  project   = google_secret_manager_secret.github_auth_token[0].project
  secret_id = google_secret_manager_secret.github_auth_token[0].secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_project_service_identity.developer_connect.member
}

# Retrieve the value of the Secret Manager Secret Version
data "google_secret_manager_secret_version" "github_auth_token" {
  count   = var.create_secret ? 1 : 0
  project = local.secret_project
  secret  = google_secret_manager_secret.github_auth_token[0].secret_id
}
