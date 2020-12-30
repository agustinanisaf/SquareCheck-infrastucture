# Configure DNS
resource "digitalocean_domain" "square-check-domain" {
  name = "square-check.me"
  ip_address = digitalocean_droplet.square-check.ipv4_address
}

# Configure DNS Records (www, api, and monitor)
resource "digitalocean_record" "www" {
  domain = digitalocean_domain.square-check-domain.name
  type = "A"
  name = "www"
  value = digitalocean_domain.square-check-domain.ip_address
}

resource "digitalocean_record" "api" {
  domain = digitalocean_domain.square-check-domain.name
  type = "A"
  name = "api"
  value = digitalocean_domain.square-check-domain.ip_address
}

resource "digitalocean_record" "monitor" {
  domain = digitalocean_domain.square-check-domain.name
  type = "A"
  name = "monitor"
  value = digitalocean_domain.square-check-domain.ip_address
}
