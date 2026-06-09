# Create Developer Connect Git Repository Links
resource "google_developer_connect_git_repository_link" "repositories" {
  for_each               = toset(var.repositories)
  provider               = google-beta
  location               = local.region
  git_repository_link_id = each.key
  parent_connection      = google_developer_connect_connection.github.connection_id
  clone_uri              = "https://github.com/${var.github_login}/${each.key}.git"
}
