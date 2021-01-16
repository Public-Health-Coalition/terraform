data "rancher2_project" "system" {
  cluster_id = rancher2_cluster.digitalocean.id
  name = "System"
  depends_on = [
    rancher2_node_pool.etcd-controlpane
  ]
}
