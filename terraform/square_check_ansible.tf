# Create Ansible Inventory file
resource "local_file" "ansible-inventory" {
  depends_on = [digitalocean_droplet.square-check]

  content = templatefile("../ansible/inventory.tmpl",
    {
      dbserver-ip = digitalocean_droplet.square-check.ipv4_address
      dbserver-name = digitalocean_droplet.square-check.name
      webserver-ip = digitalocean_droplet.square-check.ipv4_address
      webserver-name = digitalocean_droplet.square-check.name
    }
  )
  filename = "../ansible/inventory"
}

resource "local_file" "ansible-vars" {
  depends_on = [digitalocean_record.monitor]

  content = templatefile("../ansible/group_vars/all.tmpl",
    {
      monitor_domain = digitalocean_record.monitor.fqdn
    }
  )
  filename = "../ansible/group_vars/all"
}
