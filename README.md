# Infraestrutura

## Descrição do Projeto

Este é o projeto contém os arquivos que utilizo para gerar a minha infraestrutura de aplicações auto-hospedadas, com o intuíto de aprender mais sobre o funcionamento de Docker, de infraestrutura como código e redes de computadores.

Neste projeto rodo diferentes aplicações de código aberto, disponibilizadas pela comunidade na forma de container Docker.

## Aplicações Hospedadas

As aplicações que auto-hospedo são as seguintes:

- [WordPress](https://br.wordpress.org)
- [NextCloud](https://nextcloud.com)
- [GitLab](https://about.gitlab.com/pt-br)
- [Mastodon](https://joinmastodon.org/pt-BR)
- [Open WebUI](https://openwebui.com)
- Servidor de DNS Recursivo

## Tecnologias Utilizadas

As tecnologias que possibilitaram a construção dessa infraestrutura, foram:

- [Docker, Docker Compose e Dockerfile](https://www.docker.com)
- [Proxy Reverso Nginx](https://nginx.org/en/)
- [Servidor de DNS autoritativo CoreDNS](https://coredns.io)
- [Servidor de DNS recursivo Unbound](https://www.unbound.net)
- [Gerador de certificados TLS/SSL Certbot](https://certbot.eff.org)

## Como Executar

Para subir a infraestrutura, siga os seguintes passos:

### 1. Adicione as variáveis de ambiente

Este projeto está dividido em pastas, as quais possuem arquivos de variáveis de ambiente ```.env.sample```. Para cada desses arquivos, crie uma cópia, com o nome ```.env```, e preencha com as informações relativas á infraestrutura que deseja construír.

### 2. Suba a infraestrutura

Com o Docker instalado em sua máquina, abra um terminal na pasta do projeto, e digite o seguinte comando:

```sh
docker compose up -d
```