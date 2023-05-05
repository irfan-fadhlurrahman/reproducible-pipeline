#!/bin/bash

# General packages
sudo apt-get -y update
sudo apt-get -y install docker.io make git python3-pip wget unzip jq

sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Compose
source .env
mkdir ~/bin && cd ~/bin
wget "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -O docker-compose

# Export PATH
chmod +x docker-compose
echo -e '\nPATH="${HOME}/bin:${PATH}"' >> ~/.bashrc
source ~/.bashrc && cd ~