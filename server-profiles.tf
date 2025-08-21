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

# Matrix installs a current stable version of conduit server
resource "lxd_profile" "matrix" {
  name        = "profile-matrix"
  description = "Matrix server configuration profile"
  config = {
    "cloud-init.user-data" : <<EOT
    #cloud-config
    runcmd:
      - wget https://gitlab.com/api/v4/projects/famedly%2Fconduit/jobs/artifacts/master/raw/x86_64-unknown-linux-musl?job=artifacts -O /usr/sbin/conduit
      - chmod +x /usr/sbin/conduit
      - mkdir /var/lib/conduit
      - chmod 777 /var/lib/conduit
      - mkdir /etc/conduit
    EOT
  }
}
