resource "rancher2_catalog_v2" "codejamninja" {
  cluster_id = rancher2_cluster.digitalocean.id
  git_branch = "master"
  git_repo = "https://github.com/codejamninja/charts.git"
  name = "codejamninja"
  depends_on = [
    rancher2_node_pool.etcd-controlpane
  ]
}

resource "rancher2_catalog_v2" "fluxcd" {
  cluster_id = rancher2_cluster.digitalocean.id
  name = "fluxcd"
  url = "https://charts.fluxcd.io"
  depends_on = [
    rancher2_node_pool.etcd-controlpane
  ]
}

resource "rancher2_catalog_v2" "jetstack" {
  cluster_id = rancher2_cluster.digitalocean.id
  name = "jetstack"
  url = "https://charts.jetstack.io"
  depends_on = [
    rancher2_node_pool.etcd-controlpane
  ]
}

resource "rancher2_catalog_v2" "presslabs" {
  cluster_id = rancher2_cluster.digitalocean.id
  name = "presslabs"
  url = "https://presslabs.github.io/charts"
  depends_on = [
    rancher2_node_pool.etcd-controlpane
  ]
}
