output "state_instance_ip" {
  value = google_compute_instance.state_instance.network_interface[0].access_config[0].nat_ip
}

output "state_bucket_name" {
  value = google_storage_bucket.state_bucket.name
}
