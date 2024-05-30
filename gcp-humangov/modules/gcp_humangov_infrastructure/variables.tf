variable "state_name" {
  description = "The name of the US State"
}

variable "region" {
  description = "The GCP region"
  default     = "us-central1"
}

variable "ssh_key_path" {
  description = "Path to the SSH public key"
}
