resource "digitalocean_firewall" "rancher" {
  name        = var.name
  droplet_ids = [digitalocean_droplet.rancher.id]
  inbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    source_addresses      = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    source_addresses      = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
