resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.aks_rg.name}-cluster1"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myterraaks-${azurerm_resource_group.aks_rg.name}-cluster1"
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg1"

  default_node_pool {
    name                    = "systempool"
    # node_count              = 1
    vm_size                 = "standard_a2_v2"
    orchestrator_version    = data.azurerm_kubernetes_service_versions.current.latest_version
    enable_auto_scaling = true
    max_count = 3
    min_count = 1
    type = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type" = "system"
      "os-type" = "linux"
      "environment" = "dev"
      "app"    = "system-apps" 
    }
    tags = {
      "nodepool-type" = "system"
      "os-type" = "linux"
      "environment" = "dev"
      "app"    = "system-apps"
    }
  }

  oms_agent {
    msi_auth_for_monitoring_enabled = true
    log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
  }

  azure_policy_enabled = true

  role_based_access_control_enabled = true

  identity {
    type = "SystemAssigned"
  }

  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin = "azure"
    network_mode = "transparent"
    network_policy = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = var.environment
  }
}