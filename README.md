# Terraform Resources For Home Lab
This repo contains terraform resource templates for quickly setting up virtual machines and other OS instances.

These templates come from the excellant Youtuber [The Digital Life](https://www.youtube.com/c/TheDigitalLifeTech) from [this video](https://www.youtube.com/watch?v=dvyeoDBUtsU).

The original repo is also from [The Digital Life](https://www.youtube.com/c/TheDigitalLifeTech) and can be found [here](https://github.com/xcad2k/boilerplates).

## Quick Start Guide (Ubuntu)

This guide assumes there is a Virtual Machine image on Proxmox called `ubuntu-server-jammy` already present. Either create this using [packer](https://github.com/padraigconnolly/packer) or manually create it using Proxmox.

> This repo also contains my SSH Pub key in `full-clone.tf`, make sure to change this to one that you own

### Install Terraform

Start by adding the Hashicorp private repo:
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

Next update the apt cache:
```bash
sudo apt update
```

Finally install Terraform:
```bash
sudo apt install terraform
```

### Initialise Terraform

Assuming you are in the root directory (`terraform/`) of this project, initialise terraform to install all the required providers:
```bash
terraform init
```

#### Add Credentials

Edit `credentials.tfvars` to match your Proxmox instance

### Test Terraform Resource

Run the following to test the template you have created to ensure everything is ok before applying:
```bash
terraform plan -var-file=credentails.tfvars
```

### Run Terraform

Finally run Terraform to create the requested VM in proxmox:
```bash
terraform apply -auto-approve -var-file=credentails.tfvars -replace=proxmox_vm_qemu.control-plane1
```
> Note `-replace=proxmox_vm_qemu.control-plane1` is included here to remove the control-plane1 VM if it is currently present on the machine, this can be safely removed if required.

Terraform and Proxmox then takes roughly 1min 40secs to create the Virtual Machine instance.
> Note Cloud-Init will also run post terraform install but you can log into the instance while this is going on. Once cloud init is finished, it is recommended to reboot the VM so it can install the latest kernel for that version of Ubuntu.
