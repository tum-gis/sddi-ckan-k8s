# Terraform provider setup ----------------------------------------------------
terraform {
  required_providers {
    # Azure provider
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }

  # Remote backend configuration ----------------------------------------------
  # Uncomment, to use Azure as remote backend:
  # https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
  # backend "azurerm" {
  #   resource_group_name  = "tfstate"
  #   storage_account_name = "tfstatek8s0815"
  #   container_name       = "tfstate"
  #   key                  = "tfstate-key"
  # }
}
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.this.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  experiments {
    manifest_resource = true
  }
}
