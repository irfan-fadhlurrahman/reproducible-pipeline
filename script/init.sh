#!/bin/bash

# General packages
sudo apt-get -y update
sudo apt-get -y install docker.io docker-compose-plugin make git python3-pip wget unzip jq

sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Compose
source .env
FILENAME=$HOME/.docker/cli-plugins/docker-compose
wget "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -O $FILENAME
chmod +x $FILENAME