# Under construction

Once completed this project will provide IaC and instructions to setup
minimal onprem software for a dev company.

## Basic host setup - assuming Ubuntu 24.04:

Update system, install snapd, gpg, terraform and ansible. If this process changes in the future, please refer to the upstream project documentation.

```
sudo apt -y update && sudo apt -y upgrade && sudo apt -y install snapd gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt -y update && sudo apt -y install ansible terraform && sudo apt -y autoremove
```

Install and configure lxd, and give the current user permission to run it.

```
snap install lxd
sudo usermod -aG lxd $USER
```

Reboot or relog

```
lxd init
```

Create a "general" lxc profile through terraform out of partial template files and your ssh key using a provided script. This profile will update containers, install required software, and insert your ssh key into "ansible" user on container once the profile is applied. If you don't have a key, use ssh-keygen. Assuming you're using a key in the default location, position yourself in the directory where you cloned this project and run the following:

```
./create-general-profile.sh
```

Verify that general.tf has been created. Now we can initialize terraform, verify that everything is in order, and bring everything up:

```
terraform init
terraform plan
terraform apply
```

As soon as lxc resources are created via terraform, cloud-init (defined in lxc profiles) will start, and may take a while to finish on some systems. To check the status of cloud-init, the following helpful script is provided:

```
./check-cloudinit-status.sh
```

By default, resources are created via dynamic IPs. The following script will parse the lxc list format, and output a simple ansible inventory file (./inventory), as well as provide output in /etc/hosts format if you wish it:

```
./create-inv-hosts.sh
```

The above script will also try to connect and add all servers' SSH fingerprints to your `known_hosts` file. Not all configuration is done by cloud-init. First step would be to configure syslog server. Adjust configuration in templates if you want, then run:

```
ansible-playbook -i inventory config_syslog.yaml
```

TBC...
