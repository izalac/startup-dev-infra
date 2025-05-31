#cloud-config
package_update: true
package_upgrade: true
package_reboot_if_required: true
packages:
  - ssh
  - ca-certificates
  - curl
  - auditd
users:
  - name: ansible
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
