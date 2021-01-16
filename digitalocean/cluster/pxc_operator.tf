resource "rancher2_app_v2" "pxc-operator" {
  chart_name    = "pxc-operator"
  chart_version = "0.1.10"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "pxc-operator"
  namespace     = rancher2_namespace.pxc-operator.name
  repo_name     = rancher2_catalog_v2.codejamninja.name
  wait          = true
  depends_on = [
    rancher2_app_v2.helm-operator,
    time_sleep.cluster_wait
  ]
  values = <<EOF
{}
EOF
}

resource "rancher2_namespace" "pxc-operator" {
  name       = "pxc-operator"
  project_id = data.rancher2_project.system.id
  depends_on = [
    time_sleep.cluster_wait
  ]
}
