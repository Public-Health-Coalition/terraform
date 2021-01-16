resource "rancher2_app_v2" "digitalocean" {
  chart_name    = "digitalocean"
  chart_version = "0.1.30"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "digitalocean"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.codejamninja.name
  wait          = true
  depends_on = [
    time_sleep.cluster_wait
  ]
  values = <<EOF
config:
  accessToken: ${var.digitalocean_token}
EOF
}
