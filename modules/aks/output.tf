output "kube_config" {
  description = "Kube config for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = var.resource_group_name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}
