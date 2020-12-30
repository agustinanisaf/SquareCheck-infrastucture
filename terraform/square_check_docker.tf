# Create Docker Compose file
resource "local_file" "docker-configure" {
  depends_on = [
    digitalocean_record.api,
    digitalocean_record.www
  ]

  content = templatefile("../docker/docker-compose.prod.yml.tmpl",
    {
      api-fqdn = digitalocean_record.api.fqdn
      www-fqdn = digitalocean_record.www.fqdn
    }
  )
  filename = "../docker/docker-compose.prod.yml"
}
