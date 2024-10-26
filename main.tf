locals {
  project_id = "Reflexai"
  usernames = {
    "taki" : "taki@abc.com",
    "john" : "john@abc.com"
  }
}

provider "google" {
  project = local.project_id
  region  = "us-central1"  # Adjust if needed
}

# Module to manage service accounts and assign roles
module "service_accounts" {
  source     = "./modules/service-accounts"
  project_id = local.project_id
  usernames  = local.usernames
}

# Module to create BigQuery dataset and table
module "big_query" {
  source     = "./modules/big-query"
  project_id = local.project_id
}
