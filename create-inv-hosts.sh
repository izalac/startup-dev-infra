#!/bin/bash
echo Creating Ansible inventory file from lxc list
lxc list -f compact -c n4 | sed '1d' | awk '{print $1" ansible_host="$2}' | tee inventory
echo && echo Outputting in /etc/hosts format if you need it:
lxc list -f compact -c n4 | sed '1d' | awk '{print $2" "$1}'
echo && echo Accepting SSH fingerprints and testing ansible ssh access
lxc list -f compact -c n4 | sed '1d' | awk '{print $2}' > ipaddresses.tmp
for i in $(cat ipaddresses.tmp); do ssh -oStrictHostKeyChecking=accept-new ansible@$i hostname; done
rm ipaddresses.tmp
echo && echo Done.
