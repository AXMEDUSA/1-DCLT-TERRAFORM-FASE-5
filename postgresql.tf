
resource "azurerm_postgresql_flexible_server" "auth" {
  name                   = "pg-auth-solidarytech-fase5"
  location               = "centralus"
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password
  zone                   = "2"

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  # Habilitar acesso público
  public_network_access_enabled = true

  tags = local.common_tags

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql_vnet_link]
}


resource "azurerm_postgresql_flexible_server" "flag" {
  name                   = "pg-flag-solidarytech-fase5"
  location               = "centralus"
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  zone                         = "2"

  sku_name = "B_Standard_B1ms"

  # Desabilitar acesso público
  public_network_access_enabled = false

  tags = local.common_tags

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql_vnet_link]
}

resource "azurerm_postgresql_flexible_server" "targeting" {
  name                   = "pg-targeting-solidarytech-fase5"
  location               = "centralus"
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password
  zone                   = "1"

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  # Desabilitar acesso público
  public_network_access_enabled = false

  tags = local.common_tags

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgresql_vnet_link]
}

