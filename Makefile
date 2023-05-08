SHELL := /bin/bash

include .env

# Docker
create-docker-network:
	docker network create ${DOCKER_NETWORK_NAME}

docker-build:
	source .env
	docker build -f Dockerfile -t  python_prefect_dbt_piperider .

docker-compose-up:
	docker compose --env-file=.env up -d server
	docker compose --env-file=.env up -d agent

docker-compose-down:
	docker compose down --remove-orphans

# General
initial-setup:
	chmod +x ./script/init.sh && ./script/init.sh

install-terraform:
	chmod +x ./script/install_terraform.sh && ./script/install_terraform.sh

create-common-files:
	touch .env .gitignore Makefile README.md LICENSE.md

echo-sth:
	echo ${PROJECT_FOLDER}
