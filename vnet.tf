resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-solidarytech"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "public_1" {
  name                 = "snet-public-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "private_1" {
  name                 = "snet-private-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "vnet-solidarytech-aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.aks_location
  address_space       = ["10.2.0.0/16"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "aks_private" {
  name                 = "snet-aks-private"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.2.1.0/24"]
}

resource "azurerm_virtual_network_peering" "main_to_aks" {
  name                      = "peer-vnet-solidarytech-to-aks"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = azurerm_virtual_network.aks_vnet.id
}

resource "azurerm_virtual_network_peering" "aks_to_main" {
  name                      = "peer-vnet-aks-to-solidarytech"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.aks_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
}
