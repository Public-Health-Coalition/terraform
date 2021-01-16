terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    template = {
      source = "hashicorp/template"
    }
    tls = {
      source = "hashicorp/tls"
    }
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.10.6"
    }
  }
  required_version = ">= 0.13"
}
