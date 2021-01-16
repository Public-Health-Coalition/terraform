resource "rancher2_app_v2" "keycloak-crd" {
  chart_name    = "keycloak-crd"
  chart_version = "0.1.30"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "keycloak-crd"
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
