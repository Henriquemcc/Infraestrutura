#!/usr/bin/env bash
# MinIO/scripts/instalar.bash

set -euo pipefail

NAMESPACE="${NAMESPACE:-default}"
RELEASE_NAME="${RELEASE_NAME:-minio}"
SECRET_NAME="minio-credentials"

# Função para gerar senha segura
generate_password() {
  openssl rand -base64 32 | tr -d '/+=' | head -c 24
}

# Verifica se o secret já existe
if kubectl get secret "$SECRET_NAME" --namespace "$NAMESPACE" &>/dev/null; then
  echo "✅ Secret '$SECRET_NAME' já existe"
else
  echo "🔐 Criando secret com credenciais seguras..."
  
  # Gera credenciais aleatórias
  ROOT_USER="admin"
  ROOT_PASSWORD=$(generate_password)
  
  # Cria o secret no Kubernetes
  kubectl create secret generic "$SECRET_NAME" \
    --namespace "$NAMESPACE" \
    --from-literal=rootUser="$ROOT_USER" \
    --from-literal=rootPassword="$ROOT_PASSWORD"
  
  echo "✅ Secret criado com sucesso!"
  echo ""
  echo "🔑 Credenciais geradas:"
  echo "   Usuário: $ROOT_USER"
  echo "   Senha: $ROOT_PASSWORD"
  echo ""
  echo "⚠️  Salve estas credenciais em local seguro!"
  echo "   Para recuperar depois:"
  echo "   kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.rootUser}' | base64 -d"
  echo "   kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.rootPassword}' | base64 -d"
fi

# Adiciona o repositório do MinIO
helm repo add minio https://charts.min.io/
helm repo update

# Instala usando o secret existente
helm upgrade --install "$RELEASE_NAME" minio/minio \
  --namespace "$NAMESPACE" \
  --create-namespace \
  --values values.yaml \
  --set existingSecret="$SECRET_NAME" \
  --wait

echo ""
echo "✅ MinIO instalado com sucesso!"
echo "🌐 Console: http://console.minio.local"