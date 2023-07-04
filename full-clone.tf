# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "control-plane1" {
    
    # VM General Settings
    target_node = "pve"
    vmid = "201"
    name = "control-plane1"
    desc = "Description"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-jammy"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 6
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 6144

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    ciuser = "root"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPekPB/rnjpJYUmc/WW2WDcIEK1gt0SE+hGsRsBwEi8c pjconnol@LAPTOP-GSTHBNE5
    EOF

    provisioner "local-exec" {
        when = create
        command = "echo \"The IP of vm '${self.name}' is '${self.default_ipv4_address}'\""
    }
}

resource "proxmox_vm_qemu" "worker-node1" {
    
    # VM General Settings
    target_node = "pve"
    vmid = "202"
    name = "worker-node1"
    desc = "Description"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-jammy"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 6
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 6144

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    ciuser = "root"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPekPB/rnjpJYUmc/WW2WDcIEK1gt0SE+hGsRsBwEi8c pjconnol@LAPTOP-GSTHBNE5
    EOF

    provisioner "local-exec" {
        when = create
        command = "echo \"The IP of vm '${self.name}' is '${self.default_ipv4_address}'\""
    }
}

resource "proxmox_vm_qemu" "worker-node2" {
    
    # VM General Settings
    target_node = "pve"
    vmid = "203"
    name = "worker-node2"
    desc = "Description"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-jammy"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 6
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 6144

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    ciuser = "root"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPekPB/rnjpJYUmc/WW2WDcIEK1gt0SE+hGsRsBwEi8c pjconnol@LAPTOP-GSTHBNE5
    EOF

    provisioner "local-exec" {
        when = create
        command = "echo \"The IP of vm '${self.name}' is '${self.default_ipv4_address}'\""
    }
}