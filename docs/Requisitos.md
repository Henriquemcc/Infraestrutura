# Requisitos

Requisitos para a infraestrutura:

1. Rodar uma instâncida de servidor DNS recursivo.

2. Rodar uma instância do Nextcloud.

3. Rodar uma instância do GitLab.

4. Rodar uma instância do Wordpress.

5. Rodar uma instância do Mastodon.

## Requisitos do Servidor DNS Recursivo

Requisitos para o servidor DNS recursivo:

1. Deve validar DNSSEC.

2. Deve ser compatível com DNS sobre TLS.

3. Deve ser compatível com DNS sobre HTTPS.

4. Deve rodar em outro endereço IP.

5. O DNS sobre TLS e o DNS sobre HTTPS devem estar sobre o subdomínio ".dns".

## Requisitos do Nextcloud

1. Deve rodar no subdomínio ".nextcloud".

## Requisitos do GitLab

1. Deve rodar no subdomínio ".gitlab".
