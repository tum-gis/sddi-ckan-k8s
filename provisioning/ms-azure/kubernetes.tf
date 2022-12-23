# Create Azure k8s service ----------------------------------------------------
resource "azurerm_kubernetes_cluster" "this" {
  name                      = local.k8s_service_name
  location                  = local.location
  resource_group_name       = azurerm_resource_group.this.name
  node_resource_group       = local.resource_group_nodes_name
  dns_prefix                = local.k8s_service_name
  automatic_channel_upgrade = "stable"

  tags = local.tags

  identity {
    type = "SystemAssigned"
  }

  # Configure Azure k8s addons
  azure_policy_enabled             = false
  http_application_routing_enabled = var.use_azure_ingress_controller
  # aci_connector_linux {
  #   subnet_name = module.network.vnet_name
  # }

  # default pool
  default_node_pool {
    name       = "default"
    vm_size    = var.k8s_default_node_type
    node_count = var.k8s_default_node_count
    # pod_subnet_id = module.network.vnet_subnets[1]
    # enable_auto_scaling = true
    # min_count           = 2
    # max_count           = 3
  }
}

# k8s default namespace -------------------------------------------------------
# data "kubernetes_namespace" "default" {
#   metadata {
#     name = "default"
#   }
# }

# Get access to k8s node resource group
data "azurerm_resource_group" "k8s-node" {
  name = local.resource_group_nodes_name

  depends_on = [
    azurerm_kubernetes_cluster.this
  ]
}

# k8s database node pool ------------------------------------------------------
resource "azurerm_kubernetes_cluster_node_pool" "k8s-nodes-db" {
  name                  = "database"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = var.k8s_database_node_type
  node_count            = var.k8s_database_node_count

  tags = local.tags
}
