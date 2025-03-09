#!/bin/bash
echo Creating Ansible inventory file from lxc list
lxc list -f compact -c n4 | sed '1d' | awk '{print $1" ansible_host="$2}' | tee inventory
echo && echo Creating hosts file from lxc list
lxc list -f compact -c n4 | sed '1d' | awk '{print $2" "$1}' | tee hosts

