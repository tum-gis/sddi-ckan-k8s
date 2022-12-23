output "resource_group_info" {
  value = azurerm_resource_group.this
}

output "resource_group_nodes_info" {
  value = data.azurerm_resource_group.k8s-node
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.this.kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.this.kube_config.0.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.this.kube_config.0.host
  sensitive = true
}

output "cluster-fqdn" {
  value = azurerm_kubernetes_cluster.this.fqdn
}

output "cluster-info" {
  value = azurerm_kubernetes_cluster.this
  sensitive = true
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.this]
  filename   = "./.kubeconfig"
  content    = azurerm_kubernetes_cluster.this.kube_config_raw
}

# Azure DNS Zone
# output "dns-zone" {
#   value = azurerm_dns_zone.this.name
# }

# Warning - This could destroy your kubectl config file. Only use if you know what your're doing!
# resource "local_file" "kubeconfig-userhome" {
#   depends_on = [azurerm_kubernetes_cluster.this]
#   filename   = pathexpand("~/.kube/config")
#   content    = azurerm_kubernetes_cluster.this.kube_config_raw
# }
