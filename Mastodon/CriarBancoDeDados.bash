#!/bin/bash

# Lendo variáveis de ambiente
source .env

# Criando rede temporária
docker network create mastodon_net_tmp

# Criando redis
docker run -d --name mastodon_redis_tmp \
  -v Mastodon_redis:/data \
  --hostname mastodon_redis_tmp \
  --network mastodon_net_tmp \
  redis:8.2.2-alpine

# Executando banco de dados
docker run -d -e POSTGRES_USER=mastodon \
  -e POSTGRES_PASSWORD="${MASTODON_DB_PASSWORD}" \
  -e POSTGRES_DB=mastodon \
  -v Mastodon_db:/var/lib/postgresql/data \
  --name mastodon_db_tmp \
  --hostname mastodon_db_tmp \
  --network mastodon_net_tmp \
  postgres:14-alpine
sleep 5s

# Criando o banco de dados
docker run -it -e DB_NAME=mastodon_db \
  -e DB_USER=mastodon \
  -e DB_PASS="${MASTODON_DB_PASSWORD}" \
  -e DB_NAME=mastodon \
  -e DB_HOST=mastodon_db_tmp \
  -e DB_PORT=5432 \
  -e REDIS_HOST=mastodon_redis \
  -e REDIS_PORT=6379 \
  -e ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY="${MASTODON_ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY}" \
  -e ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT="${MASTODON_ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT}" \
  -e ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY="${MASTODON_ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY}" \
  -e SECRET_KEY_BASE="${MASTODON_SECRET_KEY_BASE}" \
  --network mastodon_net_tmp \
  --name mastodon_tmp \
  ghcr.io/mastodon/mastodon:v4.4.4 bin/rails db:create --trace

# Parando containers
docker stop mastodon_tmp mastodon_db_tmp mastodon_redis_tmp

# Removendo containers
docker rm mastodon_tmp mastodon_db_tmp mastodon_redis_tmp

# Removendo rede
docker network rm mastodon_net_tmp