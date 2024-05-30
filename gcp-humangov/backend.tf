terraform {
  backend "gcs" {
    bucket  = "humangov-terraform-state-ct2023"
    prefix  = "terraform/state"
  }
}
