resource "lxd_profile" "gitea" {
  name        = "profile-gitea"
  description = "Gitea configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    runcmd:
      - snap install gitea
      - apt install nginx
    EOT
  }
}

# Runner installs docker and a fixed version of runner - might require updating
resource "lxd_profile" "runner" {
  name        = "profile-gitea-runner"
  description = "Gitea runner configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    runcmd:
      - snap install docker
      - wget https://gitea.com/gitea/act_runner/releases/download/v0.2.11/act_runner-0.2.11-linux-amd64 -O /usr/bin/act_runner
      - chmod +x /usr/bin/act_runner
    EOT
  }
}

resource "lxd_profile" "syslogsrv" {
  name        = "profile-syslog"
  description = "Syslog server configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    runcmd:
      - snap install lnav
    EOT
  }
}
