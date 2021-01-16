resource "rancher2_app_v2" "rancher-monitoring" {
  chart_name    = "rancher-monitoring"
  chart_version = "9.4.201"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "rancher-monitoring"
  namespace     = rancher2_namespace.cattle-monitoring-system.name
  repo_name     = "rancher-charts"
  wait          = true
  depends_on = [
    time_sleep.cluster_wait
  ]
  values = <<EOF
prometheus:
  prometheusSpec:
    scrapeInterval: 2m
    evaluationInterval: 2m
    retention: 1d
    retentionSize: 10GiB
    storageSpec:
      volumeClaimTemplate:
        spec:
          accessModes:
            - ReadWriteOnce
          resources:
            requests:
              storage: 10Gi
          volumeMode: Filesystem
grafana:
  persistence:
    accessModes:
      - ReadWriteOnce
    size: 10Gi
    type: pvc
EOF
}

resource "rancher2_namespace" "cattle-monitoring-system" {
  name       = "cattle-monitoring-system"
  project_id = data.rancher2_project.system.id
  depends_on = [
    time_sleep.cluster_wait
  ]
}
