resource "rancher2_app_v2" "wordpress-operator" {
  chart_name    = "wordpress-operator"
  chart_version = "0.10.5"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "wordpress-operator"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.presslabs.name
  wait          = true
  depends_on = [
    time_sleep.cluster_wait
  ]
  values = <<EOF
{}
EOF
}
