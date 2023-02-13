# Local variable definitions --------------------------------------------------
locals {
  # Service region
  location = var.location

  # Node ressource group name
  resource_group_nodes_name = format("%s-nodes", var.resource_group_name)

  # Budget name
  budget_name = format("%s-budget", var.resource_group_name)
  budget_name_nodes = format("%s-budget-nodes", var.resource_group_name)

  # K8s service name
  k8s_service_name = var.resource_group_name

  # Common tags
  tags = {
    someTag    = "someValues"
  }
}

# Create a resource group -----------------------------------------------------
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = local.location
  tags     = local.tags
}
