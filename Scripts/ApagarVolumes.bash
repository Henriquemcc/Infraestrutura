#!/bin/bash
source .env
ssh "${SERVER_HOSTNAME}" "docker stop \$(docker ps -aq)"
ssh "${SERVER_HOSTNAME}" "docker rm \$(docker ps -aq)"
ssh "${SERVER_HOSTNAME}" "docker volume rm \$(docker volume ls)"