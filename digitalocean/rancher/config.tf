terraform {
  backend "s3" {
    bucket                      = "publichealthcoalition.com"
    endpoint                    = "https://sfo2.digitaloceanspaces.com"
    key                         = "terraform/kube.publichealthcoalition.com/rancher"
    region                      = "us-east-1"
    skip_credentials_validation = true
    # skip_get_ec2_platforms      = true
    skip_metadata_api_check = true
    # skip_requesting_account_id  = true
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "digitalocean" {
  token = var.digitalocean_token
}
provider "cloudflare" {
  account_id = var.cloudflare_account_id
  api_key    = var.cloudflare_api_key
  email      = var.cloudflare_email
}
variable "region" {
  type    = string
  default = "sfo2"
}
variable "name" {
  type    = string
  default = "kube"
}
variable "domain" {
  type    = string
  default = "publichealthcoalition.com"
}
variable "rancher_version" {
  type    = string
  default = "2.5.5"
}
variable "cloudflare_email" {
  type    = string
  default = ""
}
variable "cloudflare_zone_id" {
  type    = string
  default = ""
}
variable "cloudflare_account_id" {
  type    = string
  default = ""
}
variable "digitalocean_token" {
  type = string
}
variable "digitalocean_secret_key" {
  type = string
}
variable "digitalocean_access_key" {
  type = string
}
variable "cloudflare_api_key" {
  type = string
}
