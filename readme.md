Builds off of:

Terraform provider plugin for Proxmox
https://github.com/Telmate/terraform-provider-proxmox

Nixos module for Terraform
https://github.com/nix-community/terraform-nixos



Add a file called terraform.tfvars to root directory with credientials.

token_id = "UserTokenID from Proxmox"
token_secret = "Token Secret from Proxmox"
api_url = "https://ProxMoxURL/api2/json"
