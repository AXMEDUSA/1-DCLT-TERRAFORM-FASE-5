resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-solidarytech"
  location            = var.aks_location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "solidarytech"

  sku_tier = "Free"

  default_node_pool {
    name           = "default"
    vm_size        = var.aks_vm_size
    node_count     = 1
    type           = "VirtualMachineScaleSets"
    vnet_subnet_id = azurerm_subnet.aks_private.id
    # ADICIONADO: Necessário para rotacionar nós ao alterar vnet_subnet_id
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
    # # MODIFICADO: Mudado de 'kubenet' para 'azure' para melhor integração com VNet
    network_plugin = "azure"
    # # ADICIONADO: Policy de segurança para rede
    network_policy    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
    # # ADICIONADO: CIDR reservado para serviços do Kubernetes
    service_cidr = "10.1.0.0/16"
    # # ADICIONADO: IP do DNS do Kubernetes
    dns_service_ip = "10.1.0.10"
  }

  tags = local.common_tags

  depends_on = [
    azurerm_subnet.aks_private
  ]
}
