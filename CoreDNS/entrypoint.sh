#!/bin/sh
set -e

# Criando arquivo CoreDNS
envsubst < /etc/coredns/Corefile.template > /etc/coredns/Corefile

# Copia certificados para um diretório com permissões mais abertas
mkdir -p /etc/certs
cp /etc/letsencrypt/live/${BASE_DOMAIN}/fullchain.pem /etc/certs/
cp /etc/letsencrypt/live/${BASE_DOMAIN}/privkey.pem /etc/certs/
chmod 644 /etc/certs/fullchain.pem
chmod 600 /etc/certs/privkey.pem

# Executa o CoreDNS
exec coredns -conf /etc/coredns/Corefile