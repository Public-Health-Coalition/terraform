resource "digitalocean_floating_ip" "cluster" {
  region = var.region
  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      droplet_id
    ]
  }
}

resource "cloudflare_record" "cluster" {
  zone_id = var.cloudflare_zone_id
  name    = var.name
  ttl     = 3600
  type    = "A"
  value   = digitalocean_floating_ip.cluster.ip_address
  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      proxied,
      ttl
    ]
  }
}
