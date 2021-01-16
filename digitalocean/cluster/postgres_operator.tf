resource "rancher2_app_v2" "postgres-operator" {
  chart_name    = "postgres-operator"
  chart_version = "1.5.0"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "postgres-operator"
  namespace     = rancher2_namespace.postgres-operator.name
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

resource "rancher2_namespace" "postgres-operator" {
  name       = "postgres-operator"
  project_id = data.rancher2_project.system.id
  depends_on = [
    time_sleep.cluster_wait
  ]
}
