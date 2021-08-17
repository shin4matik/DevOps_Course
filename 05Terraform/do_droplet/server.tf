resource "digitalocean_droplet" "server" {
  image  = "ubuntu-20-04-x64"
  name   = "server"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [" <fingerprint> "]

connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }


  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}
