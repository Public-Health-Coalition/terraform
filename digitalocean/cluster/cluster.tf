resource "rancher2_cluster" "digitalocean" {
  name = var.name
  rke_config {
    network {
      plugin = "canal"
    }
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}
