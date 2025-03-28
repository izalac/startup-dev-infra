Github action sample to monitor all service webs every 30 minutes and on repo push.
Requires setup of the following variables in repo settings:

`GITEASRV_CURL` to the accessible (port-forwarded) IP:PORT of the server running gitea, should be the ip of your host:3000
`MATRIXSRV_CURL` to the accessible (port-forwarded) IP:PORT of the server running matrix/conduwuit, should be the ip of your host:8008
