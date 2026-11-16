# Requisitos

Requisitos para a infraestrutura:

1. Rodar uma instância do MinIO.
2. Rodar uma instância de servidor DNS recursivo.
3. Rodar uma instância do Nextcloud.
4. Rodar uma instância do GitLab.
5. Rodar uma instância do Wordpress.
6. Rodar uma instância do Mastodon.
7. Rodar uma instância do MailCow.
8. Rodar uma instância do Dockpeek.
9. Todas as instâncias devem ser pods Kubernetes, dando preferência para Healms Kubernetes.

## Requisitos do MinIO

Requisitos para o MinIO:

1. Deve rodar no subdomínio "minio".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.
3. Os dados armazenados devem ser salvos na pasta "~/MinIO".


## Requisitos do Servidor DNS Recursivo

Requisitos para o servidor DNS recursivo:

1. Deve validar DNSSEC.
2. Deve ser compatível com DNS sobre TLS.
3. Deve ser compatível com DNS sobre HTTPS.
4. Deve rodar em outro endereço IP.
5. O DNS sobre TLS e o DNS sobre HTTPS devem estar sobre o subdomínio "dns".
6. Os certificados SSL/TLS do DNS sobre TLS e DNS sobre HTTPS devem ser assinados digitalmente pelo Let's Encrypt.
7. Deve permitir bloquear domínios através do Pi-Hole.

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
3. Os dados armazenados devem ser salvos na pasta "~/Wordpress".

## Requisitos do Mastodon

1. Deve rodar no subdomínio "mastodon".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.
3. Os dados armazenados devem ser salvos em volumes com o nome iniciando com "Mastodon".

## Requisitos do MailCow

1. Deve rodar no subdomínio "mail".
2. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.

## Requisitos do Dockpeek

1. O certificado SSL/TLS deve ser assinado digitalmente pelo Let's Encrypt.