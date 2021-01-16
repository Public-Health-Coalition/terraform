resource "rancher2_node_pool" "etcd-controlpane" {
  name             = "etcd-controlpane"
  cluster_id       = rancher2_cluster.digitalocean.id
  hostname_prefix  = "etcd-controlpane"
  node_template_id = rancher2_node_template.sfo2-4vcpu-8gb.id
  quantity         = 1
  control_plane    = true
  etcd             = true
  worker           = false
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}

resource "rancher2_node_pool" "sfo2-2vcpu-4gb" {
  name             = "sfo2-2vcpu-4gb"
  cluster_id       = rancher2_cluster.digitalocean.id
  hostname_prefix  = "sfo2-2vcpu-4gb"
  node_template_id = rancher2_node_template.sfo2-2vcpu-4gb.id
  quantity         = 2
  control_plane    = false
  etcd             = false
  worker           = true
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}

resource "rancher2_node_pool" "sfo2-4vcpu-8gb" {
  name             = "sfo2-4vcpu-8gb"
  cluster_id       = rancher2_cluster.digitalocean.id
  hostname_prefix  = "sfo2-4vcpu-8gb"
  node_template_id = rancher2_node_template.sfo2-4vcpu-8gb.id
  quantity         = 2
  control_plane    = false
  etcd             = false
  worker           = true
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}
