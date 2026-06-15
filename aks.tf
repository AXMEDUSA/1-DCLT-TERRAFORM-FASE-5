resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-solidarytech"
  location            = var.aks_location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "solidarytech"

  sku_tier = "Free"

  default_node_pool {
    name                        = "default"
    vm_size                     = var.aks_vm_size
    node_count                  = var.aks_node_count
    type                        = "VirtualMachineScaleSets"
    vnet_subnet_id              = azurerm_subnet.aks_private.id
    temporary_name_for_rotation = "temp"
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].upgrade_settings
    ]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
    service_cidr      = "10.1.0.0/16"
    dns_service_ip    = "10.1.0.10"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id
  }

  tags = local.common_tags

  depends_on = [
    azurerm_subnet.aks_private
  ]
}

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "law-solidarytech-f5-cus"
  location            = var.aks_location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.common_tags
}
