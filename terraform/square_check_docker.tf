# Create Docker Compose file
resource "local_file" "docker-configure" {
  depends_on = [
    digitalocean_record.api,
    digitalocean_record.www,
    digitalocean_record.s3
  ]

  content = templatefile("../docker/docker-compose.prod.yml.tmpl",
    {
      api-fqdn = digitalocean_record.api.fqdn
      www-fqdn = digitalocean_record.www.fqdn
      s3-fqdn = digitalocean_record.s3.fqdn
      www-domain = digitalocean_record.www.domain
    }
  )
  filename = "../docker/docker-compose.prod.yml"
}
