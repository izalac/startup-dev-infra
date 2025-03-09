#!/bin/bash
cd $(mktemp -d)
curl -fLO https://download.zulip.com/server/zulip-server-latest.tar.gz
tar -xf zulip-server-latest.tar.gz
./zulip-server-*/scripts/setup/install --email=root@localhost --hostname=localhost --self-signed-cert
