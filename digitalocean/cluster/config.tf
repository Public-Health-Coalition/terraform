terraform {
  backend "s3" {
    bucket                      = "publichealthcoalition.com"
    endpoint                    = "https://sfo2.digitaloceanspaces.com"
    key                         = "terraform/kube.publichealthcoalition.com/cluster"
    region                      = "us-east-1"
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}

provider "aws" {
  region = "us-east-1"
}
provider "digitalocean" {
  token = var.digitalocean_token
}
provider "rancher2" {
  api_url    = var.rancher_hostname
  access_key = var.rancher_access_key
  secret_key = var.rancher_secret_key
}
provider "cloudflare" {
  account_id = var.cloudflare_account_id
  api_key    = var.cloudflare_api_key
  email      = var.cloudflare_email
}

resource "time_sleep" "cluster_wait" {
  depends_on      = [rancher2_node_pool.etcd-controlpane]
  create_duration = var.cluster_wait
}

variable "rancher_hostname" {
  type    = string
  default = "https://kube.publichealthcoalition.com"
}
variable "domain" {
  type    = string
  default = "publichealthcoalition.com"
}
variable "s3_bucket" {
  type    = string
  default = "publichealthcoalition.com"
}
variable "cloudflare_email" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = "sfo2"
}
variable "image" {
  type    = string
  default = "ubuntu-18-04-x64"
}
variable "name" {
  type    = string
  default = "digitalocean.sfo2"
}
variable "rancher_access_key" {
  type = string
}
variable "rancher_secret_key" {
  type = string
}
variable "digitalocean_secret_key" {
  type = string
}
variable "digitalocean_access_key" {
  type = string
}
variable "digitalocean_token" {
  type = string
}
variable "cloudflare_api_key" {
  type = string
}
variable "cloudflare_zone_id" {
  type    = string
  default = ""
}
variable "cloudflare_account_id" {
  type    = string
  default = ""
}
variable "cluster_wait" {
  type    = string
  default = "600s"
}
