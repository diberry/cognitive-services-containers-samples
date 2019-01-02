# Container support for Azure Cognitive Services

[Container support](http://aka.ms/cognitive-services-containers) in [Azure Cognitive Services](http://aka.ms/cognitive-services) allows developers to use the same rich APIs that are available in Azure, but with the flexibility that comes with [Docker containers](https://www.docker.com/what-container). Container support is currently available in preview for a subset of [Azure Cognitive Services](http://aka.ms/cognitive-services), including parts of [Computer Vision](https://go.microsoft.com/fwlink/?linkid=848310&clcid=0x409), [Face](https://go.microsoft.com/fwlink/?linkid=848324&clcid=0x409), and [Text Analytics](https://go.microsoft.com/fwlink/?linkid=848375&clcid=0x409).

**This repository contains a set of samples illustrating how to interact with and configure the cognitive services containers.**


## Samples

|Cognitive Service|Container|Kubernetes files|Service samples|
|--|--|--|--|
|Face|face|[✔](/blob/master/Kubernetes/face/) |[.Net](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/dotnet/Face) and [Python](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/python/Face) samples|
|Language Understanding (LUIS)|luis|[✔](/blob/master/Kubernetes/language-understanding/) |[.Net](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/dotnet/language-understanding) and [Python](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/python/language-understanding) samples|
|Text Analytics|language|[✔](/blob/master/Kubernetes/language/) |[.Net](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/dotnet/language) and [Python](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/python/language) samples|
|Computer vision|cognitive-services-recognize-text|[✔](/blob/master/Kubernetes/recognize-text/)|[.Net](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/dotnet/recognize-text) and [Python](https://github.com/Azure-Samples/cognitive-services-containers-samples/tree/master/python/recognize-text) samples|

## Related tools

Powershell scripts:

* [add registry secret](/blob/master/Kubernetes/add-registry-secret.ps1) - In order for your Kubernetes pods to pull from the container registry, you'll need a Kubernetes secret with the registry credentials. Run this script to get help creating that secret from credentials stored in an Azure KeyVault.

## How to use

The overall process is:
1. Create an Azure Container resource
1. Configure container
1. Push container to Azure Container resource
1. Run container


1. Create an Azure Container Registry resource in the Azure portal.
1. During the creation, enable Admin User. The admin user for the container is the resource name. The password for the container is the resource key. 
1. In Azure CLI, login:

    ```
    docker login --username <username> --password <password> <login server>
    ```

    These values are available from the Azure Container Registry resource you created in the previous step. Go to the **Access keys** page to get all three values.

1. Before you push the image to your registry, you must tag the image with the Azure Container Regristry login server name. 

    ```
    docker tag microsoft/aci-helloworld <login server>/<repository name>/aci-helloworld:v1
    ```

1. Push image

    ```
    docker push <login server>/<repository name>/aci-helloworld:v1
    ```

1. 
For the latest information about which containers are available and how to set them up, please see [Container support in Azure Cognitive Services](http://aka.ms/cognitive-services-containers)

