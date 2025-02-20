#!/bin/bash
cp templates/general.tf.t ./general.tf
cat templates/cloud-init.yaml.t | sed 's/^/    /' >> ./general.tf 
cat ~/.ssh/id_rsa.pub | sed 's/^/        - /' >> ./general.tf
cat templates/general.tf.t2 >> ./general.tf 
