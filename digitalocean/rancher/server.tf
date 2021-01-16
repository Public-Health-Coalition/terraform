resource "digitalocean_droplet" "rancher" {
  image              = "ubuntu-20-04-x64"
  name               = "${var.name}-rancher"
  private_networking = true
  region             = var.region
  size               = "s-2vcpu-4gb"
  ssh_keys           = [digitalocean_ssh_key.ssh_key.id]
  user_data          = data.template_file.rancher_cloudconfig.rendered
  lifecycle {
    prevent_destroy = false
    ignore_changes  = []
  }
}

data "template_file" "rancher_cloudconfig" {
  template = file("cloud-config.yml")
  vars = {
    cloudflare_email = var.cloudflare_email
    domain           = var.domain
    name             = var.name
    rancher_version  = var.rancher_version
  }
}
