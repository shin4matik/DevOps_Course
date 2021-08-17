resource "digitalocean_droplet" "www-1" {
  image  = "ubuntu-20-04-x64"
  name   = "www-1"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.example_vpc.id

/* 
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
*/
    user_data = <<EOF
apt update
apt install -y nginx
systemctl start nginx
EOF
}
