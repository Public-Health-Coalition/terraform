resource "rancher2_app_v2" "replicator-operator" {
  chart_name    = "replicator-operator"
  chart_version = "0.0.2"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "replicator-operator"
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
