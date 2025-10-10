#!/bin/bash

# Lendo variáveis de ambiente
source .env

# Criando roles
docker run -it \
  -e DB_NAME=mastodon \
  -e DB_USER=mastodon \
  -e DB_PASS="${MASTODON_DB_PASSWORD}" \
  -e DB_HOST=mastodon_db \
  -e DB_PORT=5432 \
  -e REDIS_HOST=mastodon_redis \
  -e REDIS_PORT=6379 \
  -e ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY="${MASTODON_ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY}" \
  -e ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT="${MASTODON_ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT}" \
  -e ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY="${MASTODON_ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY}" \
  -e SECRET_KEY_BASE="${MASTODON_SECRET_KEY_BASE}" \
  --network "${NETWORK_NAME}" \
  --name mastodon_tmp \
  ghcr.io/mastodon/mastodon:v4.4.4 \
  bash -c "RAILS_ENV=production bin/rails runner 'UserRole.create!(name: \"admin\") unless UserRole.exists?(name: \"admin\"); UserRole.create!(name: \"moderator\") unless UserRole.exists?(name: \"moderator\"); UserRole.create!(name: \"user\") unless UserRole.exists?(name: \"user\")'"


# Parando containers
docker stop mastodon_tmp

# Removendo containers
docker rm mastodon_tmp