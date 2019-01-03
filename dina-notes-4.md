## Prerequisites

1. Install azure command line and validate that the cli works in a terminal. 
1. Install docker engine and validate that the docker cli works in a terminal.
1. Install kubectl and validate that the kubectl cli works in a terminal. 
1. Have valid Azure subscription. The trial subscription will work. 

## Create Azure Container Registry service

The steps in this section are performed from a terminal or command line. If you are using an enhanced terminal, validate that the azure command line is available. 

1. Login to Azure

    `az login`

2. Create resource group to hold every created in tutorial

    `az group create --name cogserv-container-rg --location westus`

3. Create Azure Container Registry

    `az acr create --resource-group cogserv-container-rg --name cogservcontainerregistry --sku Basic`

    save results to get:
        loginServer property:
        name property:

    ```{
    "adminUserEnabled": false,
    "creationDate": "2019-01-02T23:49:53.783549+00:00",
    "id": "/subscriptions/65a1016d-0f67-45d2-b838-b8f373d6d52e/resourceGroups/cogserv-container-rg/providers/Microsoft.ContainerRegistry/registries/cogservcontainerregistry",
    "location": "westus",
    "loginServer": "cogservcontainerregistry.azurecr.io",
    "name": "cogservcontainerregistry",
    "provisioningState": "Succeeded",
    "resourceGroup": "cogserv-container-rg",
    "sku": {
        "name": "Basic",
        "tier": "Basic"
    },
    "status": null,
    "storageAccount": null,
    "tags": {},
    "type": "Microsoft.ContainerRegistry/registries"
    }```

## Pull down image from docker hub



1. 

## Move local Image to Azure Container Registry

1. Create image on local machine

    docker build

2. Tag local image with registry 

    docker tag

3. Push local image to registry

    docker push

    registry: diberrycontainerregistry001
    registry resourcegroup:diberry-rg-container
    registry loginserver = diberrycontainerregistry001.azurecr.io
    registry username = diberrycontainerregistry001
    registry password = ntRFwOFd9AOmcEUvpOdTEMPwN6D/hTAS

## Create Azure Kubernetes service

1. Get credentials

    az aks get-credentials

1. Create service

    az aks create

1. List service

    az aks list

1. Verify creation

    kubectl get nodes

1. Create nodes in service

    kubectl apply -f dina-ta-language-aks.yml

1. Delete service

    az aks delete

