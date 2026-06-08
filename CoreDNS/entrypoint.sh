#!/bin/sh

# Função para copiar certificado com validação
copy_cert() {
    local src="$1"
    local dst="$2"
    local perm="$3"

    if [ -f "$src" ]; then
        cp "$src" "$dst"
        chmod "$perm" "$dst"
        echo "✓ Certificado copiado: $dst"
    else
        echo "⚠ Aviso: Arquivo não encontrado: $src" >&2
        # Opcional: falhar ou continuar dependendo da sua lógica
        # return 1
    fi
}

# Criando arquivo CoreDNS
envsubst < /etc/coredns/Corefile.template > /etc/coredns/Corefile

# Copia certificados para um diretório com permissões mais aberta
mkdir -p /etc/certs
copy_cert /etc/letsencrypt/live/${BASE_DOMAIN}/fullchain.pem /etc/certs/ 644
copy_cert /etc/letsencrypt/live/${BASE_DOMAIN}/privkey.pem /etc/certs/ 600

# Executa o CoreDNS
exec coredns -conf /etc/coredns/Corefile