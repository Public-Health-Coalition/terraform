resource "rancher2_node_template" "sfo2-2vcpu-2gb" {
  name                = "sfo2-2vcpu-2gb"
  cloud_credential_id = rancher2_cloud_credential.digitalocean.id
  digitalocean_config {
    backups            = false
    image              = var.image
    ipv6               = true
    monitoring         = false
    private_networking = true
    region             = var.region
    size               = "s-2vcpu-2gb"
    tags               = ""
    userdata           = data.template_file.node_cloudconfig.rendered
    ssh_port           = 2222
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}

resource "rancher2_node_template" "sfo2-2vcpu-4gb" {
  name                = "sfo2-2vcpu-4gb"
  cloud_credential_id = rancher2_cloud_credential.digitalocean.id
  digitalocean_config {
    backups            = false
    image              = var.image
    ipv6               = true
    monitoring         = false
    private_networking = true
    region             = var.region
    size               = "s-2vcpu-4gb"
    tags               = ""
    userdata           = data.template_file.node_cloudconfig.rendered
    ssh_port           = 2222
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}

resource "rancher2_node_template" "sfo2-4vcpu-8gb" {
  name                = "sfo2-4vcpu-8gb"
  cloud_credential_id = rancher2_cloud_credential.digitalocean.id
  digitalocean_config {
    backups            = false
    image              = var.image
    ipv6               = true
    monitoring         = false
    private_networking = true
    region             = var.region
    size               = "s-4vcpu-8gb"
    tags               = ""
    userdata           = data.template_file.node_cloudconfig.rendered
    ssh_port           = 2222
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}


data "template_file" "node_cloudconfig" {
  template = file("cloud-config.yml")
  vars     = {}
}
