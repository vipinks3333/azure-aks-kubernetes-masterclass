output "versions" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

output "latest_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}

output "cluster_id" {
  
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "Cluster_version" {
  value = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
}

