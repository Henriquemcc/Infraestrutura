#!/bin/bash
source .env
rsync --delete --verbose --archive --recursive "$(dirname "$(pwd)")/" \
  "${USERNAME}@${SERVER_HOSTNAME}:${PATH_PASTA_INFRAESTRUTURA}"