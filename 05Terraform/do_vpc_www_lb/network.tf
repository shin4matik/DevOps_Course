resource "digitalocean_vpc" "example_vpc" {
  name     = "example-project-network"
  region   = "fra1"
  ip_range = "10.114.88.0/24"
}