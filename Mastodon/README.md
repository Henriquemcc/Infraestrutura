# Mastodon

## Pré-requisitos

Para instalar o Mastodon é necessário ter os seguintes componentes instalados:

- [Helm CLI](https://helm.sh/docs/intro/install)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [K3S](https://k3s.io/)
- [MinIO](https://www.min.io/)

## Configuração

Para configurar o Mastodon, siga os seguintes passos:

### Adicionando repositório helm do Mastodon

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando:

```shell
helm repo add mastodon https://mastodon.github.io/helm-charts
```

### Atualizando informações do repositório

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando:

```shell
helm repo update
```

### Gerando arquivo de configuração

Copie o arquivo ```values.yaml.sample``` para ```values.yaml```.

### Altere os valores do arquivo de configuração

Em um editor de texto, abra o arquivo [values.yaml](values.yaml) e altere os valores das variáveis de ambiente

### Instale o chart

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando:

```shell
helm install mastodon mastodon --values ./my-values.yaml
```

### Acesse localmente

#### Encaminhamento de porta

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando:

```shell
kubectl -n mastodon port-forward svc/mastodon-web 3000:3000
```

#### Criação do usuário administrador

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando, substituindo ```<ENDEREÇO-DE-EMAIL>``` pelo endereço de e-mail do usuário administrador:

```shell
kubectl -n mastodon exec -it deploy/mastodon-web -- tootctl accounts create admin --email <ENDEREÇO-DE-EMAIL> --confirmed --role Owner
```