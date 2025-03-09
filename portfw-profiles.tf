# Port forwarding profiles - use only once per host

# SSH for jumphost
resource "lxd_profile" "pf-ssh" {
  name        = "pf-ssh"
  description = "SSH port forwarding profile"

  device {
    type = "proxy"
    name = "ssh-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:20022"
      connect = "tcp:127.0.0.1:22"
    }
  }
}

# app - blue deployment
resource "lxd_profile" "app-blue" {
  name        = "app-blue"
  description = "App forwarding profile - blue deployment"

  device {
    type = "proxy"
    name = "blue-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:8000"
      connect = "tcp:127.0.0.1:8001"
    }
  }

  device {
    type = "proxy"
    name = "green-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:9000"
      connect = "tcp:127.0.0.1:8002"
    }
  }
}

# app - green deployment
resource "lxd_profile" "app-green" {
  name        = "app-green"
  description = "App forwarding profile - green deployment"

  device {
    type = "proxy"
    name = "green-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:8000"
      connect = "tcp:127.0.0.1:8002"
    }
  }

  device {
    type = "proxy"
    name = "blue-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:9000"
      connect = "tcp:127.0.0.1:8001"
    }
  }
}

# gitea-proxy
resource "lxd_profile" "gitea-proxy" {
  name        = "gitea-proxy"
  description = "Gitea forwarding profile"

  device {
    type = "proxy"
    name = "gitea-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:3000"
      connect = "tcp:127.0.0.1:3000"
    }
  }
}

# zulip-https
resource "lxd_profile" "zulip-https" {
  name        = "zulip-https"
  description = "Zulip forwarding profile - https"

  device {
    type = "proxy"
    name = "zulip-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:8443"
      connect = "tcp:127.0.0.1:443"
    }
  }
}

# zulip-http
resource "lxd_profile" "zulip-http" {
  name        = "zulip-http"
  description = "Zulip forwarding profile - http"

  device {
    type = "proxy"
    name = "zulip-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:8080"
      connect = "tcp:127.0.0.1:80"
    }
  }
}
