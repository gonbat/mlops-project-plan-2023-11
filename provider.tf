terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.50.0"
    }
  }
  backend "gcs" {
    bucket = "mlops-project-plan-2023-11-ts"
  }
}

provider "google" {
  project = local.project_id
  region  = "us-central1"
}
