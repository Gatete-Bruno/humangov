###Create Network and Subnet##

resource "google_compute_network" "vpc_network" {
  name = "humangov-${var.state_name}-vpc-network"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "humangov-${var.state_name}-subnet"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}

##Create Firewall Rules##
resource "google_compute_firewall" "default" {
  name    = "humangov-${var.state_name}-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]
}

##Create GCE Instance##

resource "google_compute_instance" "state_instance" {
  name         = "humangov-${var.state_name}-instance"
  machine_type = "f1-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnetwork.self_link

    access_config {
      // Include this section to give the VM an external IP address
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }

  tags = ["web"]
}

resource "google_compute_firewall" "ssh" {
  name    = "humangov-${var.state_name}-allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

##Create GCS Bucket##
resource "google_storage_bucket" "state_bucket" {
  name     = "humangov-${var.state_name}-bucket"
  location = var.region
}

resource "google_storage_bucket_iam_member" "bucket_member" {
  bucket = google_storage_bucket.state_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}


