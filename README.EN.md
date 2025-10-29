[Versão em Português](README.md)

# Infrastructure

## Project Description

This project contains the files used to generate my self-hosted application infrastructure, with the aim of learning more about Docker, infrastructure as code and computer networks.

In this project I run different open source applications, provided by the community in the form of Docker container.

## Self-Hosted Applications

The self-hosted applications are the following:

- [WordPress](https://wordpress.org)
- [NextCloud](https://nextcloud.com)
- [GitLab](https://about.gitlab.com)
- [Mastodon](https://joinmastodon.org)
- [Open WebUI](https://openwebui.com)
- Recursive DNS Server

## Technologies Used

The technologies that allowed the construction of that infrastructure are:

- [Docker, Docker Compose and Dockerfile](https://www.docker.com)
- [Nginx Reverse Proxy](https://nginx.org/en/)
- [CoreDNS Authoritative DNS Server](https://coredns.io)
- [Unbound Recursive DNS Server](https://www.unbound.net)
- [Certbot generator of TLS/SSL certificates](https://certbot.eff.org)

## How to Run

To deploy the infrastructure, follow these steps:

### 1. Add the environment variables

This project is divided in folders in which contains sample environment variables files ```.env.sample```. For each of these files, create a copy, with the name ```.env```, and fill them with the information related to the infrastructure that you aims to build.

### 2. Generate the TLS/SSL certificates

In the folder ```Certbot```, execute the following command:

```sh
docker compose up
```

And the TLS certificates will be generated.

### 3. Deploy the infrastructure

In the project folder, execute the following command:

```sh
docker compose up -d
```

And the infrastructure will be deployed.