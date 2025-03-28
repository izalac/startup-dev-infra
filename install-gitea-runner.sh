#!/bin/bash

RUNNER_RELEASE='https://gitea.com/gitea/act_runner/releases/download/v0.2.11/act_runner-0.2.11-linux-amd64'
INSTANCE_URL='http://localhost:3000'
RUNNER_NAME='demo-runner-1'
GITEATOKEN=$(lxc exec gitea -- gitea actions generate-runner-token)

echo Installs gitea runner locally
sudo snap install docker
sudo wget $RUNNER_RELEASE -O /usr/bin/act_runner
sudo chmod +x /usr/bin/act_runner
sudo /usr/bin/act_runner register --no-interactive --instance $INSTANCE_URL --token $GITEATOKEN --name $RUNNER_NAME
sudo mkdir /opt/act_runner
sudo mv .runner /opt/act_runner
sudo cp ./templates/gitea-runner.service /etc/systemd/system/gitea-runner.service
sudo systemctl daemon-reload
sudo systemctl enable --now gitea-runner.service
sudo systemctl status gitea-runner.service | cat
