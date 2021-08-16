resource "digitalocean_loadbalancer" "www-lb" {
  name = "www-lb"
  region = "fra1"
  vpc_uuid = digitalocean_vpc.example_vpc.id
 
  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.www-1.id, digitalocean_droplet.www-2.id ]
}
