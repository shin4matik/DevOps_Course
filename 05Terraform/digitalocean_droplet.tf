terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.11.0"
      }
    }
}

variable "do_token" {}
provider "digitalocean" {
    token = var.do_token

}

resource "digitalocean_droplet" "ub20_droplet" {
  image  = "ubuntu-20-04-x64"
  name   = "ub20-1"
  region = "fra1"
  size   = "s-1vcpu-1gb"
}