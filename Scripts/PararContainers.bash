#!/bin/bash
source .env
ssh "${SERVER_HOSTNAME}" "docker stop \$(docker ps -aq)"