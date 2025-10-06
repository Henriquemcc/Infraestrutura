#!/bin/bash
source .env
ssh "${SERVER_HOSTNAME}" "docker ps"