# Configure firewall
resource "digitalocean_firewall" "square_check-firewall" {
  name = "square_check-firewall"
  droplet_ids = [digitalocean_droplet.square_check.id]

  inbound_rule {
    protocol = "tcp"
    port_range = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol = "tcp"
    port_range = "80"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol = "tcp"
    port_range = "443"
    source_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0"]
  }
}