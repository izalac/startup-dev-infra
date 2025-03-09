#!/bin/bash
lxc file push ./templates/install-zulip.sh zulip/tmp
lxc exec zulip -- chmod +x /tmp/install-zulip.sh
lxc exec zulip -- /tmp/install-zulip.sh

