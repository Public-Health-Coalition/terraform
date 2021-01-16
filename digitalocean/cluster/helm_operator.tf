resource "rancher2_app_v2" "helm-operator" {
  chart_name    = "helm-operator"
  chart_version = "1.2.0"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "helm-operator"
  namespace     = rancher2_namespace.flux.name
  repo_name     = rancher2_catalog_v2.fluxcd.name
  wait          = true
  depends_on = [
    time_sleep.cluster_wait
  ]
  values = <<EOF
helm:
  versions: v3
EOF
}

resource "rancher2_namespace" "flux" {
  name       = "flux"
  project_id = data.rancher2_project.system.id
  depends_on = [
    time_sleep.cluster_wait
  ]
}
