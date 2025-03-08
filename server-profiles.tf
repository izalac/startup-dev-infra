resource "lxd_profile" "gitea" {
  name        = "profile-gitea"
  description = "Gitea configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    runcmd:
      - snap install gitea
    EOT
  }
}

# downloading runner has fixed version - URL might require updating
resource "lxd_profile" "runner" {
  name        = "profile-gitea-runner"
  description = "Gitea runner configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    runcmd:
      - wget https://gitea.com/gitea/act_runner/releases/download/v0.2.11/act_runner-0.2.11-linux-amd64 -O /usr/bin/act_runner
      - chmod +x /usr/bin/act_runner
    EOT
  }
}

# TBD
resource "lxd_profile" "zulip" {
  name        = "profile-zulip"
  description = "Zulip configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    EOT
  }
}
