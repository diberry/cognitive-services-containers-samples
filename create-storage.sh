#!/bin/bash

# Change these four parameters
AKS_PERS_STORAGE_ACCOUNT_NAME=diberry$RANDOM
AKS_PERS_RESOURCE_GROUP=diberry-rg-container
AKS_PERS_LOCATION=westus
AKS_PERS_SHARE_NAME=aksshare

# Create the Resource Group
az group create --name $AKS_PERS_RESOURCE_GROUP --location $AKS_PERS_LOCATION

# Create the storage account
az storage account create -n diberry-storage -g diberry-rg-container -l westus --sku Standard_LRS

>az storage account create -n diberrystorage -g diberry-rg-container -l westus --sku Standard_LRS
{
  "accessTier": null,
  "creationTime": "2018-12-31T22:26:28.755686+00:00",
  "customDomain": null,
  "enableHttpsTrafficOnly": false,
  "encryption": {
    "keySource": "Microsoft.Storage",
    "keyVaultProperties": null,
    "services": {
      "blob": {
        "enabled": true,
        "lastEnabledTime": "2018-12-31T22:26:28.818178+00:00"
      },
      "file": {
        "enabled": true,
        "lastEnabledTime": "2018-12-31T22:26:28.818178+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "id": "/subscriptions/65a1016d-0f67-45d2-b838-b8f373d6d52e/resourceGroups/diberry-rg-container/providers/Microsoft.Storage/storageAccounts/diberrystorage",
  "identity": null,
  "kind": "Storage",
  "lastGeoFailoverTime": null,
  "location": "westus",
  "name": "diberrystorage",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://diberrystorage.blob.core.windows.net/",
    "file": "https://diberrystorage.file.core.windows.net/",
    "queue": "https://diberrystorage.queue.core.windows.net/",
    "table": "https://diberrystorage.table.core.windows.net/"
  },
  "primaryLocation": "westus",
  "provisioningState": "Succeeded",
  "resourceGroup": "diberry-rg-container",
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "capabilities": null,
    "kind": null,
    "locations": null,
    "name": "Standard_LRS",
    "resourceType": null,
    "restrictions": null,
    "tier": "Standard"
  },
  "statusOfPrimary": "available",
  "statusOfSecondary": null,
  "tags": {},
  "type": "Microsoft.Storage/storageAccounts"
}

# Export the connection string as an environment variable, this is used when creating the Azure file share
az storage account show-connection-string -n diberrystorage -g diberry-rg-container -o tsv

DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=diberrystorage;AccountKey=LZ0eKd4zLsiHEq454YpX6HNh1VW+U1LMMmoFEaBa5TtrgTzhbtXH6vK3MeGWpg+y1iLyZD1gzO3J/N3S8THtng==

# Create the file share
>az storage share create -n aksshare --quota 10 --account-name diberrystorage --account-key LZ0eKd4zLsiHEq454YpX6HNh1VW+U1LMMmoFEaBa5TtrgTzhbtXH6vK3MeGWpg+y1iLyZD1gzO3J/N3S8THtng==
{
  "created": true
}

# Get storage account key
>az storage account keys list --resource-group diberry-rg-container --account-name diberrystorage --query "[0].value" -o tsv
LZ0eKd4zLsiHEq454YpX6HNh1VW+U1LMMmoFEaBa5TtrgTzhbtXH6vK3MeGWpg+y1iLyZD1gzO3J/N3S8THtng==

>kubectl create secret generic azure-secret --from-literal=azurestorageaccountname=diberrystorage --from-literal=azurestorageaccountkey=LZ0eKd4zLsiHEq454YpX6HNh1VW+U1LMMmoFEaBa5TtrgTzhbtXH6vK3MeGWpg+y1iLyZD1gzO3J/N3S8THtng==
secret "azure-secret" created