#!/bin/bash

# Lendo variáveis de ambiente
source .env

# Criando roles
docker exec -it "${MASTODON_WEB_CONTAINER_NAME}" bash -c "RAILS_ENV=production bin/rails runner 'UserRole.create!(name: \"Owner\") unless UserRole.exists?(name: \"Owner\"); UserRole.create!(name: \"Admin\") unless UserRole.exists?(name: \"Admin\"); UserRole.create!(name: \"Moderator\") unless UserRole.exists?(name: \"Moderator\"); UserRole.create!(name: \"User\") unless UserRole.exists?(name: \"User\")'"