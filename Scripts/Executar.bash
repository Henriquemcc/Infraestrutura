#!/bin/bash
source .env
ssh "${SERVER_HOSTNAME}" "docker stop \$(docker ps -aq)"
ssh "${SERVER_HOSTNAME}" "docker rm \$(docker ps -aq)"
ssh "${SERVER_HOSTNAME}" "cd \"${PATH_PASTA_INFRAESTRUTURA}\"; docker compose up --force-recreate --build"
