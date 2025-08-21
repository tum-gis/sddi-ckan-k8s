# Microsoft Azure Kubernetes Service

This folder contains a basic example for provisioning a "Managed Kubernetes Cluster"
from Microsoft Azure using [Terraform](https://www.terraform.io/).
The Terraform scripts deploy an instance of
[Azure Kubernetes Service (AKS)](https://azure.microsoft.com/en-us/products/kubernetes-service/) with two [node pools](https://learn.microsoft.com/en-us/azure/aks/intro-kubernetes#clusters-and-nodes)
of customizable
[Azure VM types](https://docs.microsoft.com/de-de/azure/virtual-machines/sizes-general)
called `default` and `database` pool.

This is just a basic example. For detailed information on all configuration
options visit the [`azurerm_kubernetes_cluster`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) docs.

## Requirements

* [Azure CLI installed](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
* [Terraform installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* Microsoft Azure subscription

## :hammer_and_wrench: Usage

1. Clone this repo and switch to the [provisioning/ms-azure](provisioning/ms-azure) folder.

    ```bash
    git clone --depth 1 https://github.com/tum-gis/sddi-ckan-k8s
    cd sddi-ckan-k8s/provisioning/ms-azure
    ```

2. Run Terraform initialization

    ```bash
    terraform init
    ```

3. Get the Azure _subscription id_:

   ```bash
   az account show --query id --output tsv
   ```

4. Decide for [Azure VM types](https://docs.microsoft.com/de-de/azure/virtual-machines/sizes-general) and count
   for both node pools, a name of the `resource group`, and provide one or more email addresses for budget warning notifications. Pass these options to
   `terraform plan` to create an execution plan.

    ```bash
    terraform plan -out plan.json \
      -var subscription_id="id_from_step_3" \
      -var resource_group_name="ckan-aks-rg" \
      -var 'tags={key1="tag1",key2="tag2"}' \
      -var 'contact_emails=["me@example.com","other@example.com"]' \
      -var k8s_default_node_type="Standard_A2_v2" \
      -var k8s_default_node_count=2 \
      -var k8s_database_node_type="Standard_D4s_v3" \
      -var k8s_database_node_count=1
    ```

5. Apply the plan to book the specified resources.

    ```bash
    terraform apply plan.json
    ```

6. The access credentials of the AKS instance are output in `.kubeconfig`.
   Store the credentials in a safe place and add them to your
   `~/.kube/config` file to use them with e.g. `kubectl`. After that, it is recommended to delete the file.
