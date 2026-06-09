variable "create_secret" {
  description = "Whether to create the GitHub OAuth Token Secret"
  type        = bool
  default     = false
}

variable "github_app" {
  description = "The GitHub App integration type. Common values include DEVELOPER_CONNECT or FIREBASE."
  type        = string
  default     = "FIREBASE"
}

variable "github_app_installation_id" {
  description = "Installation ID for the GitHub App. Required if github_app is DEVELOPER_CONNECT."
  type        = number
  default     = null
}

variable "connection_id" {
  description = "Connection ID for the Developer Connect connection"
  type        = string
  default     = "github"
}

variable "github_login" {
  description = "GitHub login of the user or organization that owns the repositories"
  type        = string
}

variable "oauth_token_secret" {
  description = "Name of the GitHub OAuth Token Secret"
  type        = string
  default     = "github-token"
}

variable "oauth_token_secret_version" {
  description = "Secret Version ID of the GitHub OAuth Token"
  type        = string
  default     = "latest"
}

variable "project" {
  description = "Google Project ID in which to create the Developer Connect resources"
  type        = string
}

variable "region" {
  description = "Region of the Developer Connect Connection to GitHub"
  type        = string
  default     = ""
}

variable "repositories" {
  description = "List of GitHub repositories to create Developer Connect Git Repository Links for"
  type        = list(string)
  default     = []
}

variable "secret_project" {
  description = "Google Project ID in which the GitHub OAuth Token Secret is stored"
  type        = string
  default     = null
}
