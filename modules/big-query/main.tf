variable "project_id" {
  type = string
}

resource "google_bigquery_dataset" "test_data" {
  dataset_id = "test_data"
  project    = var.project_id
  location   = "US"
}

resource "google_bigquery_table" "transcripts" {
  dataset_id = google_bigquery_dataset.test_data.dataset_id
  table_id   = "transcripts"
  project    = var.project_id

  schema = jsonencode([
    {
      "name": "Id",
      "type": "STRING",
      "mode": "REQUIRED"
    },
    {
      "name": "Created_at",
      "type": "DATETIME",
      "mode": "REQUIRED"
    },
    {
      "name": "Content",
      "type": "STRING",
      "mode": "REQUIRED"
    },
  ])
}
