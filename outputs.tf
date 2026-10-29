output "resource_group_name" {
  description = "Name of the Azure resource group"
  value       = azurerm_resource_group.aks.name
}

output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "cluster_location" {
  description = "Azure region hosting AKS"
  value       = azurerm_kubernetes_cluster.aks.location
}

output "cluster_id" {
  description = "AKS resource ID"
  value       = azurerm_kubernetes_cluster.aks.id
}