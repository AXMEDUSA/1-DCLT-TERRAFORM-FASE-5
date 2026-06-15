#!/usr/bin/env bash
set -euo pipefail

# Cria o storage account + container usados como backend remoto do Terraform
# Uso: ./scripts/bootstrap-backend.sh [resource_group] [location] [storage_account] [container]

RG=${1:-rg-solidarytech-fase5}
LOCATION=${2:-eastus2}
STORAGE_ACCOUNT=${3:-sasolidarytechstate}
CONTAINER=${4:-tfstate}

echo "Bootstrap backend: RG=$RG LOCATION=$LOCATION STORAGE=$STORAGE_ACCOUNT CONTAINER=$CONTAINER"

if ! command -v az >/dev/null 2>&1; then
  echo "Azure CLI (az) não encontrado. Instale ou execute em ambiente com az CLI." >&2
  exit 1
fi

echo "Verificando login..."
if ! az account show >/dev/null 2>&1; then
  echo "Por favor rode: az login" >&2
  exit 1
fi

echo "Criando resource group (se não existir)..."
az group create --name "$RG" --location "$LOCATION" >/dev/null

echo "Criando storage account (se não existir)..."
az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RG" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --access-tier Hot >/dev/null

echo "Obtendo chave do storage account..."
KEY=$(az storage account keys list --resource-group "$RG" --account-name "$STORAGE_ACCOUNT" --query "[0].value" -o tsv)

echo "Criando container '$CONTAINER'..."
az storage container create --name "$CONTAINER" --account-name "$STORAGE_ACCOUNT" --account-key "$KEY" >/dev/null

echo ""
echo "Backend bootstrap concluído."
echo "  resource_group_name  = \"$RG\""
echo "  storage_account_name = \"$STORAGE_ACCOUNT\""
echo "  container_name       = \"$CONTAINER\""
echo "  key                  = \"terraform.tfstate\""
