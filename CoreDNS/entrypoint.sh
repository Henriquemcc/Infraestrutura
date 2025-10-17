#!/bin/sh
set -e

# Copia certificados para um diretório com permissões mais abertas
mkdir -p /etc/certs
cp /etc/letsencrypt/live/mydomain.com/fullchain.pem /etc/certs/
cp /etc/letsencrypt/live/mydomain.com/privkey.pem /etc/certs/
chmod 644 /etc/certs/fullchain.pem
chmod 600 /etc/certs/privkey.pem

# Executa o CoreDNS
exec /coredns -conf /etc/coredns/Corefile