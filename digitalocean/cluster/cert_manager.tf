resource "rancher2_app_v2" "cert-manager-crd" {
  chart_name    = "cert-manager-crd"
  chart_version = "v1.1.0"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "cert-manager-crd"
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

resource "rancher2_app_v2" "cert-manager" {
  chart_name    = "cert-manager"
  chart_version = "v1.1.0"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "cert-manager"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.jetstack.name
  wait          = true
  depends_on = [
    rancher2_app_v2.cert-manager-crd,
    time_sleep.cluster_wait
  ]
  values = <<EOF
{}
EOF
}

resource "rancher2_app_v2" "cluster-issuer" {
  chart_name    = "cluster-issuer"
  chart_version = "1.1.0"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "cluster-issuer"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.codejamninja.name
  wait          = true
  depends_on = [
    rancher2_app_v2.cert-manager,
    time_sleep.cluster_wait
  ]
  values = <<EOF
config:
  cloudflareApiKey: ${var.cloudflare_api_key}
  clusterType: rke
  email: ${var.cloudflare_email}
EOF
}
