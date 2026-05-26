#!/bin/bash

# Lendo variáveis de ambiente
source .env

# Inicializando banco de dados
docker run -i --rm \
  -v powerdns_db:/var/lib/mysql \
  -v "$(pwd)/schema.sql:/docker-entrypoint-initdb.d/schema.sql:ro" \
  --name powerdns_db_tmp_initializer \
  -e MARIADB_ROOT_PASSWORD="${POWERDNS_DB_ROOT_PASS}" \
  -e MARIADB_DATABASE="${POWERDNS_DB_NAME}" \
  -e MARIADB_USER="${POWERDNS_DB_USER}" \
  -e MARIADB_PASSWORD="${POWERDNS_DB_PASS}" \
  mariadb:11 &

# Aguarda até que os logs indiquem que o banco está pronto (e o schema aplicado)
echo "Aguardando a execução do script schema.sql..."
#docker logs -f powerdns_db_tmp_initializer 2>&1 | grep -m 1 "ready for connections"
sleep 10s

# Para o container (a flag --rm no 'run' cuidará da remoção automática)
echo "Inicialização concluída. Parando o container temporário..."
docker stop powerdns_db_tmp_initializer