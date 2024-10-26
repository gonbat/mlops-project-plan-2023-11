locals {
  project_id = "reflexai-439703"
  usernames = {
    "taki" : "taki@abc.com",
    "john" : "john@abc.com"
  }
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
