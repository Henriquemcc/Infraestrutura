#!/bin/bash

# Lendo variáveis de ambiente
source .env

# Criando conta de dono
docker exec -it "${MASTODON_WEB_CONTAINER_NAME}"  bash -c "RAILS_ENV=production; bin/tootctl accounts create \"${MASTODON_ADMIN_USERNAME}\" --email \"${MASTODON_ADMIN_EMAIL}\" --confirmed --role Owner"