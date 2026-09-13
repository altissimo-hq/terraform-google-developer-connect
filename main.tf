terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.4.0"
    }
  }
}

data "google_client_config" "current" {}
