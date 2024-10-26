variable "project_id" {
  type = string
}

variable "usernames" {
  type = map(string)
}

# Create service accounts for each user in `usernames`
resource "google_service_account" "sa" {
  for_each    = var.usernames
  account_id  = each.key
  display_name = "Service Account for ${each.value}"
  project     = var.project_id
}

# Assign roles to each service account
resource "google_project_iam_member" "logging_viewer" {
  for_each = var.usernames
  project  = var.project_id
  role     = "roles/logging.viewer"
  member   = "serviceAccount:${google_service_account.sa[each.key].email}"
}

resource "google_project_iam_member" "logging_viewAccessor" {
  for_each = var.usernames
  project  = var.project_id
  role     = "roles/logging.viewAccessor"
  member   = "serviceAccount:${google_service_account.sa[each.key].email}"
}

resource "google_project_iam_member" "bigquery_admin" {
  for_each = var.usernames
  project  = var.project_id
  role     = "roles/bigquery.admin"
  member   = "serviceAccount:${google_service_account.sa[each.key].email}"
}
