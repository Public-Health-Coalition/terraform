resource "rancher2_app_v2" "velero" {
  chart_name    = "velero"
  chart_version = "2.14.1"
  cluster_id    = rancher2_cluster.digitalocean.id
  name          = "velero"
  namespace     = rancher2_namespace.velero.name
  repo_name     = rancher2_catalog_v2.codejamninja.name
  wait          = true
  depends_on = [
    rancher2_app_v2.helm-operator,
    time_sleep.cluster_wait
  ]
  values = <<EOF
velero:
  backupsEnabled: true
  deployRestic: true
  snapshotsEnabled: true
  metrics:
    enabled: true
  configuration:
    provider: aws
    backupStorageLocation:
      bucket: ${var.s3_bucket}
      prefix: velero
      config:
        profile: default
        region: ${var.region}
        s3Url: https://${var.region}.digitaloceanspaces.com
    volumeSnapshotLocation:
      provider: digitalocean.com/velero
      config:
        region: ${var.region}
config:
  accessKeyId: ${var.digitalocean_access_key}
  secretAccessKey: ${var.digitalocean_secret_key}
  digitaloceanToken: ${var.digitalocean_token}
EOF
}

resource "rancher2_namespace" "velero" {
  name       = "velero"
  project_id = data.rancher2_project.system.id
  depends_on = [
    time_sleep.cluster_wait
  ]
}
