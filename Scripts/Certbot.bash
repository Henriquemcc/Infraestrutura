#!/bin/bash
source .env
ssh "${SERVER_HOSTNAME}" "docker stop \$(docker ps -aq)"
ssh "${SERVER_HOSTNAME}" "cd \"${PATH_PASTA_INFRAESTRUTURA}/Certbot\"; docker compose up"
