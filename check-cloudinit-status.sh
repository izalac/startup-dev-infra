#!/bin/bash
for i in $(lxc list -cn -fcsv); do echo -n "$i " && lxc exec $i -- cloud-init status; done
