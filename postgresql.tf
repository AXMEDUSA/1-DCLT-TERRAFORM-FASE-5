resource "azurerm_postgresql_flexible_server" "ngo" {
  name                   = "pg-ngo-solidarytech-v2"
  location               = var.pg_location
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = false

  tags = merge(local.common_tags, { Service = "ngo-service" })

  lifecycle {
    ignore_changes = [zone]
  }
}

resource "azurerm_postgresql_flexible_server" "donation" {
  name                   = "pg-donation-solidarytech-v2"
  location               = var.pg_location
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = false

  tags = merge(local.common_tags, { Service = "donation-service" })

  lifecycle {
    ignore_changes = [zone]
  }
}

resource "azurerm_postgresql_flexible_server" "volunteer" {
  name                   = "pg-volunteer-solidarytech-v2"
  location               = var.pg_location
  resource_group_name    = azurerm_resource_group.rg.name
  version                = "15"
  administrator_login    = "adminuser"
  administrator_password = var.db_admin_password

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"

  public_network_access_enabled = false

  tags = merge(local.common_tags, { Service = "volunteer-service" })

  lifecycle {
    ignore_changes = [zone]
  }
}
