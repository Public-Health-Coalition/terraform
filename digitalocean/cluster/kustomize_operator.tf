resource "rancher2_app_v2" "kustomize-operator" {
  chart_name    = "kustomize-operator"
  chart_version = "0.0.6"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "kustomize-operator"
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
