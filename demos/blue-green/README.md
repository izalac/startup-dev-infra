Github action sample to build a sample golang app and deploy it to blue and green targets on appsrv.

The config in `portfw_profiles.tf` is setup with this in mind. Tested with ansible user, will require modifications if used otherwise.

Requires setup of the following secrets in repo settings:

`SSH_USER` to the user you plan to use, ansible by default.

`SSH_HOST` to the server you plan to use, appsrv by default. You can use hostnames due to internal DNS on LXD

`SSH_PRIVATE_KEY` paste in the private key for ansible user - if you use other user, make sure they're authenticated on the jumphost and ssh host

`JUMP_HOST` to the IP address of the server running jumphost - do NOT use 127.0.0.1 here, as container will have its own IP address

`JUMP_PORT` to the port-forwarded ssh port for your jumphost, default should be 20022

To switch between blue and green deployments: in `main.tf` change `lxd_profile.app-blue.name` to `lxd_profile.app-green.name` or vice versa, and run `terraform apply` this will switch up which app is currently exposed on port 8000 and which is on port 9000 on host.
