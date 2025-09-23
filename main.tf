terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      #latest version as of Nov 30 2022
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  # References our vars.tf file to plug in the api_url 
  pm_api_url = var.api_url
  # References our secrets.tfvars file to plug in our token_id
  pm_api_token_id = var.token_id
  # References our secrets.tfvars to plug in our token_secret 
  pm_api_token_secret = var.token_secret
  # Default to `true` unless you have TLS working within your pve setup 
  pm_tls_insecure = true
}



resource "proxmox_lxc" "lxc-test" {
    features {
        nesting = true
    }
    hostname = "lxc-debian-13"
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
        ip6 = "dhcp"
    }
    ostemplate = "local:vztmpl/debian-13-standard_13.1-1_amd64.tar.zst"
    rootfs {
        storage = "local-zfs"
        size    = "4G"
    }
    password = "rootroot"
    pool = "terraform"
    target_node = "pve"
    unprivileged = true
}