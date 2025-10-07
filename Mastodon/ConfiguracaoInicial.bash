#!/bin/bash
docker compose up -d mastodon_db mastodon_redis
docker compose run --rm mastodon_web bundle exec rails db:setup
docker compose run --rm mastodon_web bundle exec rails db:migrate
docker compose run --rm mastodon_web bundle exec rails assets:precompile
docker compose up