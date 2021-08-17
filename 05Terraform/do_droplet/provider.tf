terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.11.0"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
    token = var.do_token

}
