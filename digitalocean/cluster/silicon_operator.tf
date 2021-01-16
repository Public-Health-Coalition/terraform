resource "rancher2_app_v2" "silicon-operator" {
  chart_name    = "silicon-operator"
  chart_version = "0.0.5"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "silicon-operator"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.codejamninja.name
  wait          = true
  depends_on = [
    time_sleep.cluster_wait
  ]
  values = <<EOF
{}
EOF
}
