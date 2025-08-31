# Requisitos

Requisitos para a infraestrutura:

1. Rodar uma instância de servidor DNS recursivo.
2. Rodar uma instância do Nextcloud.
3. Rodar uma instância do GitLab.
4. Rodar uma instância do Wordpress.
5. Rodar uma instância do Mastodon.
6. Todas as instâncias devem ser containers Docker.

## Requisitos do Servidor DNS Recursivo

Requisitos para o servidor DNS recursivo:

1. Deve validar DNSSEC.
2. Deve ser compatível com DNS sobre TLS.
3. Deve ser compatível com DNS sobre HTTPS.
4. Deve rodar em outro endereço IP.
5. O DNS sobre TLS e o DNS sobre HTTPS devem estar sobre o subdomínio "dns".
6. Os certificados SSL/TLS do DNS sobre TLS e DNS sobre HTTPS devem ser assinados digitalmente pelo Let's Encrypt.

## Requisitos do Nextcloud

1. Deve rodar no subdomínio "nextcloud".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.
3. Os dados armazenados devem ser salvos na pasta "~/Nextcloud".

## Requisitos do GitLab

1. Deve rodar no subdomínio "gitlab".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.
3. Os dados armazenados devem ser salvos na pasta "~/GitLab".

## Requisitos do Wordpress

1. Deve rodar no subdomínio "blog".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.

## Requisitos do Mastodon

1. Deve rodar no subdomínio "mastodon".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.