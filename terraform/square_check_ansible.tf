# Create Ansible Inventory file
resource "null_resource" "ansible-provision" {
  depends_on = [digitalocean_droplet.square-check]

  provisioner "local-exec" {
    command = "echo '${digitalocean_droplet.square-check.name} ansible_host=${digitalocean_droplet.square-check.ipv4_address} ansible_ssh_user=root ansible_python_interpreter=/usr/bin/python3' > ../ansible/hosts"
  }
}
