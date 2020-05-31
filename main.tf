resource "google_cloud_run_service" "default" {
	name = "cloudrun-srv"
	location = "europe-west1"
	project = "peppy-breaker-278616"

	template {
		spec {
			containers {
				image = "gcr.io/peppy-breaker-278616/node"
			}
		}
	}

	traffic {
		percent = 100
		latest_revision = true
	}
}
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
