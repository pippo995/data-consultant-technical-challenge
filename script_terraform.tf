terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
}

provider "google" {
  project = "<YOUR_PROJECT_ID>"
  region  = "europe-west4"
}

resource "google_service_account" "account" {
  account_id   = "gc-sa"
  display_name = "Test Service Account"
}

resource "google_pubsub_topic" "topic_test" {
  name = "topic-test"
}

resource "google_cloud_scheduler_job" "job_test" {
  name        = "job-test"
  description = "Invio messaggio giornaliero"
  schedule    = "0 0 * * *"
  
  pubsub_target {
    topic_name = google_pubsub_topic.topic_test.name
    data       = base64encode("Test message")
  }
}

resource "google_storage_bucket" "bucket_source" {
  name                        = "bucket-gcf-source" # Every bucket name must be globally unique
  location                    = "US"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "object_source" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.bucket_source.name
  source = "function-source.zip" # Add path to the zipped function source code
}

resource "google_cloudfunctions2_function" "function_test" {
  name        = "function_test"
  location    = "eu-west4"
  description = "a test function"

  build_config {
    runtime     = "nodejs16"
    entry_point = "helloPubSub" # Set the entry point
    environment_variables = {
      BUILD_CONFIG_TEST = "build_test"
    }
    source {
      storage_source {
        bucket = google_storage_bucket.bucket_source.name
        object = google_storage_bucket_object_source.object.name
      }
    }
  }

  service_config {
    max_instance_count = 3
    min_instance_count = 1
    available_memory   = "256M"
    timeout_seconds    = 60
    environment_variables = {
      SERVICE_CONFIG_TEST = "config_test"
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = google_service_account.account.email
  }

  event_trigger {
    trigger_region = "eu-west4"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = google_pubsub_topic.topic_test.id
    retry_policy   = "RETRY_POLICY_RETRY"
  }
}

resource "google_bigquery_dataset" "dataset_test" {
  dataset_id   = "dataset_test"
  location     = "EU"
}

resource "google_storage_bucket" "bucket_test" {
  name     = "bucket_test"
  location = "EU"
}
