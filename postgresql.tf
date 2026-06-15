resource "azurerm_postgresql_flexible_server" "ngo" {
  name                   = "pg-ngo-solidarytech-f5"
  location               = var.aks_location
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password
  zone                   = "1"

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = false

  tags = merge(local.common_tags, { Service = "ngo-service" })

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql_vnet_link]
}

resource "azurerm_postgresql_flexible_server" "donation" {
  name                   = "pg-donation-solidarytech-f5"
  location               = var.aks_location
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password
  zone                   = "2"

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = true

  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = false

  tags = merge(local.common_tags, { Service = "donation-service" })

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql_vnet_link]
}

resource "azurerm_postgresql_flexible_server" "volunteer" {
  name                   = "pg-volunteer-solidarytech-f5"
  location               = var.aks_location
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password
  zone                   = "1"

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = false

  tags = merge(local.common_tags, { Service = "volunteer-service" })

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql_vnet_link]
}
