output "oauth_token_secret_version" {
  description = "Secret Version ID of the GitHub OAuth Token"
  value       = local.oauth_token_secret_version
}

output "repository_ids" {
  description = "Map of Developer Connect Git Repository Links"
  value       = { for repo in google_developer_connect_git_repository_link.repositories : repo.git_repository_link_id => repo.id }
}
