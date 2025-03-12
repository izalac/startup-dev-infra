resource "lxd_instance" "jumphost" {
  name      = "jumphost"
  image     = "ubuntu:noble"
  ephemeral = "false"
  profiles  = ["default", lxd_profile.general.name, lxd_profile.pf-ssh.name]
}

resource "lxd_instance" "gitea" {
  name      = "gitea"
  image     = "ubuntu:noble"
  ephemeral = "false"
  profiles  = ["default", lxd_profile.general.name, lxd_profile.gitea.name, lxd_profile.gitea-proxy.name]
}

resource "lxd_instance" "gitea-runner" {
  name      = "gitea-runner"
  image     = "ubuntu:noble"
  ephemeral = "false"
  profiles  = ["default", lxd_profile.general.name, lxd_profile.runner.name]
}

resource "lxd_instance" "zulip" {
  name      = "zulip"
  image     = "ubuntu:noble"
  ephemeral = "false"
  profiles  = ["default", lxd_profile.general.name, lxd_profile.zulip-https.name]
}

resource "lxd_instance" "appsrv" {
  name      = "appsrv"
  image     = "ubuntu:noble"
  ephemeral = "false"
  profiles  = ["default", lxd_profile.general.name, lxd_profile.app-blue.name]
}

resource "lxd_instance" "syslogsrv" {
  name      = "syslogsrv"
  image     = "ubuntu:noble"
  ephemeral = "false"
  profiles  = ["default", lxd_profile.general.name, lxd_profile.syslogsrv.name]
}
