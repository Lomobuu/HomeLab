#!/bin/bash

# Exit on error
set -e

# Input variables from GitHub Actions secrets
RESOURCE_GROUP="Homelab-management-RG"
LOCATION="westeurope"
STORAGE_ACCOUNT="tfstate$RANDOM"
CONTAINERS=("dev" "test" "prod")

echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating storage account..."
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2

echo "Fetching storage account key..."
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group $RESOURCE_GROUP \
  --account-name $STORAGE_ACCOUNT \
  --query "[0].value" -o tsv)

echo "Creating blob containers..."
for ENV in "${CONTAINERS[@]}"; do
  az storage container create \
    --name "tfstate-$ENV" \
    --account-name $STORAGE_ACCOUNT \
    --account-key $ACCOUNT_KEY
done

echo "✅ Storage account '$STORAGE_ACCOUNT' and containers created successfully."