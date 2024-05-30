variable "project" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region"
  default     = "us-central1"
}

variable "states" {
  description = "A list of state names"
  default     = ["california", "florida", "texas"]
}
