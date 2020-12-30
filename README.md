Sprint 5 WPPL - Infrastructure (Aplikasi absensi online --> Square Check)

How To Use Terraform
=== 

Provision your server on digital ocean
---

The first thing to do is to fill up the variables needed by terraform

```bash
$ cd terraform
$ cp terraform.tfvars.example terraform.tfvars
$ nano terraform.tfvars
```

In `terraform.tfvars` there will be guide on how to get the value for your account

After filling up the variables, you can now run terraform commands

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

To delete your server you can use the below command to do so.

```bash
$ terraform destroy
```

How to Use Ansible
===

**Before going with the process, please check your `inventory` file and `group_vars/all` file**

On the `group_vars/all` there are some additional env variables that need to be filled

Then, copy your `.env` for backend to `roles/web/files/.env` or you could fill up with the `.env.example`

```bash
$ cp roles/web/files/.env.example roles/web/files/.env
$ nano .env
```

Lastly, run the ansible command to configure your server

```bash
$ cd ansible
$ ansible-playbook -i inventory square_check_all.yml
```

How to Use Docker-Compose
===

For testing on local test command to run docker-compose are below  
*use `-f` flag because docker-compose file are not default*

```bash
$ cd docker
$ docker-compose -f docker-compose.prod.yml up -d
```
