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
}
