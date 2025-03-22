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
    name = "blue-proxy-b"

    properties = {
      listen  = "tcp:0.0.0.0:8000"
      connect = "tcp:127.0.0.1:8001"
    }
  }

  device {
    type = "proxy"
    name = "green-proxy-b"

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
    name = "green-proxy-g"

    properties = {
      listen  = "tcp:0.0.0.0:8000"
      connect = "tcp:127.0.0.1:8002"
    }
  }

  device {
    type = "proxy"
    name = "blue-proxy-g"

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
    name = "gitea-http-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:3000"
      connect = "tcp:127.0.0.1:3000"
    }
  }
}

# matrix-proxy
resource "lxd_profile" "matrix-proxy" {
  name        = "matrix-proxy"
  description = "Matrix forwarding profile"

  device {
    type = "proxy"
    name = "matrix-port-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:8008"
      connect = "tcp:127.0.0.1:8008"
    }
  }
}
