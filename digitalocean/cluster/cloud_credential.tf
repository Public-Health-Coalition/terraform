resource "rancher2_cloud_credential" "digitalocean" {
  name = "digitalocean"
  digitalocean_credential_config {
    access_token = var.digitalocean_token
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = []
  }
}
