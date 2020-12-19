resource "digitalocean_droplet" "square_check" {
  image              = "ubuntu-18-04-x64"
  name               = "square_check"
  region             = "sgp1"
  size               = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.square_check.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
  # provisioner "remote-exec" {
  #   inline = [
  #     "export PATH=$PATH:/usr/bin",
  #     # Install nginx
  #     "sudo apt-get update",
  #     "sudo apt-get -y install nginx"
  #   ]
  # }
}

# Display output after droplet created
output "ip" {
  value = digitalocean_droplet.square_check.ipv4_address
}