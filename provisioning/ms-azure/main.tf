# Local variable definitions --------------------------------------------------
locals {
  # Service region
  location = "West Europe"

  # Node ressource group name
  resource_group_nodes_name = format("%s-nodes", var.resource_group_name)

  # Budget name
  budget_name = format("%s-budget", var.resource_group_name)
  budget_name_nodes = format("%s-budget-nodes", var.resource_group_name)

  # K8s service name
  k8s_service_name = var.resource_group_name

  # Common tags
  tags = {
    partner    = "TUM-GI"
    subproject = "MSA"
  }
}

# Create a resource group -----------------------------------------------------
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = local.location
  tags     = local.tags
}

# # Create a virtual network within the resource group --------------------------
# module "network" {
#   source              = "Azure/network/azurerm"
#   resource_group_name = azurerm_resource_group.this.name
#   address_space       = "10.162.0.0/16"
#   subnet_prefixes     = ["10.162.1.0/24"]
#   subnet_names        = ["subnet-aks"]
#   depends_on          = [azurerm_resource_group.this]
#   tags = local.tags
# }

# With separate subnet for pods
# module "network" {
#   source              = "Azure/network/azurerm"
#   resource_group_name = azurerm_resource_group.this.name
#   address_spaces       = ["10.162.0.0/16"]
#   subnet_prefixes     = ["10.162.1.0/24", "10.162.2.0/24"]
#   subnet_names        = ["subnet-aks", "subnet-pods"]
#   depends_on          = [azurerm_resource_group.this]

#   tags = local.tags
# }
