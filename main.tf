provider "google" {
  project = "brave-dimension-438111-v4"
  region  = "us-central1" # 
}

resource "google_compute_instance" "default" {
  name         = "test-instance"
  machine_type = "e2-micro" # You can choose the machine type you need
  zone         = "us-central1-a" # Your preferred zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Choose a public image
    }
  }

  network_interface {
    # Use the default network
    network = "default"
    access_config {
      # This gives the instance a public IP address
    }
  }

  tags = ["http-server", "https-server"] # Optional, for firewall rules
}


output "instance_name" {
  value = google_compute_instance.default.name
}
