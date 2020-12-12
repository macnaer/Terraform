
# Specify the provider (GCP, AWS, Azure)
provider "google" {
  credentials = "${file("credentials.json")}"
  project     = "privatterminalinfo"
  region      = "us-central1-a"
}
