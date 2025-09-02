#!/bin/sh
. ./.env
export BASE_DOMAIN
envsubst < Corefile.template > Corefile