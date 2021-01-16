resource "rancher2_app_v2" "externaldb-operator" {
  chart_name    = "externaldb-operator"
  chart_version = "0.0.12"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "externaldb-operator"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.codejamninja.name
  wait          = true
  depends_on = [
    rancher2_app_v2.kustomize-operator,
    time_sleep.cluster_wait
  ]
  values = <<EOF
{}
EOF
}
