# MinIO

## Pré-requisitos

Para instalar o MinIO é necessário ter os seguintes componentes instalados:

- [Helm CLI](https://helm.sh/docs/intro/install)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [K3S](https://k3s.io/)

## Configuração

Para configurar o MinIO, siga os seguintes passos:

### Instalar o MinIO operator via Kustomization

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando:

```shell
kubectl kustomize github.com/minio/operator\?ref=v7.1.1 | kubectl apply -f -
```

### Construír a configuração de Tenant

#### Definição das variáveis

##### Storage user

Renomeie o arquivo ```storage-user.yaml.sample``` para ```storage-user.yaml```.

Gere um novo valor para as variáveis ```CONSOLE_ACCESS_KEY``` e ```CONSOLE_SECRET_KEY```.

##### Tenant Config

Renomeie o arquivo ```tenant-config.yaml.sample``` para ```tenant-config.yaml```.

Altere o valor da variável ```MINIO_ROOT_USER``` e gere um novo valor para a variável ```MINIO_ROOT_PASSWORD```.

#### Aplicação do Kustomization Kubernetes

Em um Terminal, PowerShell ou Prompt de Comando, execute o seguinte comando:

```shell
kubectl apply -k kustomization.yaml
```