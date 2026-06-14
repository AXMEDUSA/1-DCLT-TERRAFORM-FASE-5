#!/usr/bin/env bash
set -euo pipefail

# Script to create the storage account + container used as Terraform backend
# Usage: ./scripts/bootstrap-backend.sh [resource_group] [location] [storage_account] [container]
# Defaults match repository variables/backend.tf

RG=${1:-rg-fiap-tech-challange-fase-5}
LOCATION=${2:-eastus2}
STORAGE_ACCOUNT=${3:-safiaptechchallangetf5}
CONTAINER=${4:-tfstate}

echo "Bootstrap backend: RG=$RG LOCATION=$LOCATION STORAGE=$STORAGE_ACCOUNT CONTAINER=$CONTAINER"

if ! command -v az >/dev/null 2>&1; then
  echo "Azure CLI (az) not found. Install or run from environment with az CLI." >&2
  exit 1
fi

echo "Verifying login..."
if ! az account show >/dev/null 2>&1; then
  echo "Por favor rode: az login" >&2
  exit 1
fi

echo "Creating resource group (if not exists)..."
az group create --name "$RG" --location "$LOCATION" >/dev/null

echo "Creating storage account (if not exists)..."
az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RG" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --access-tier Hot >/dev/null

echo "Retrieving storage account key..."
KEY=$(az storage account keys list --resource-group "$RG" --account-name "$STORAGE_ACCOUNT" --query "[0].value" -o tsv)

echo "Creating container '$CONTAINER'..."
az storage container create --name "$CONTAINER" --account-name "$STORAGE_ACCOUNT" --account-key "$KEY" >/dev/null

echo "Backend bootstrap concluído. Backend: resource_group=$RG storage_account=$STORAGE_ACCOUNT container=$CONTAINER"
