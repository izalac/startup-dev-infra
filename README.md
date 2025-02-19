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

Create a "general" lxc profile out of two partial template files and your ssh key. This will update containers, install required software, and insert your ssh key into "ansible" user on container once the profile is applied. If you don't have a key, use ssh-keygen. Assuming you're using a key in the default location, position yourself in the directory where you cloned this project and run the following:

```
cp templates/vendor-data.yaml.t ./general.yaml
cat templates/cloud-init.yaml.t | sed 's/^/    /' >> ./general.yaml
cat ~/.ssh/id_rsa.pub | sed 's/^/        - /' >> ./general.yaml

lxc profile create general
lxc profile edit general < general.yaml
```

TBC...
