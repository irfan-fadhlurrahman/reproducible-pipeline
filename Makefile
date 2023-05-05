SHELL := /bin/bash

include .env

# Docker
create-docker-network:
	docker network create ${DOCKER_NETWORK_NAME}

docker-build:
	docker build -f Dockerfile -t python_prefect_dbt_piperider .
	
docker-spin-up:
	docker-compose --env-file=.env up -d prefect_server
	docker-compose --env-file=.env up -d prefect_agent

docker-spin-down:
	docker-compose down

# General
initial-setup:
	chmod +x ./script/init.sh && ./script/init.sh
	chmod +x ./script/install_terraform.sh && ./script/install_terraform.sh

create-common-files:
	touch .env .gitignore Makefile README.md LICENSE.md