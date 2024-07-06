resource "azurerm_kubernetes_cluster_node_pool" "linux1" {
  name                  = "linux1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  mode = "User"
  os_type = "Linux"
  vm_size               = "standard_a2_v2"
#   node_count            = 1
  enable_auto_scaling = true
  max_count = 3
  min_count = 1
  orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb = 30
  os_disk_type = "Managed"
  priority = "Regular"

  node_labels = {
    "environment" = var.environment
    "node-pool-type" = "user"
    "app" = "java-app"
  }
  

  tags = {
    Environment = var.environment
    "environment" = var.environment
    "node-pool-type" = "user"
    "app" = "java-app"
  }
}