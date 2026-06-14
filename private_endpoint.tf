# ==================== PRIVATE DNS ZONE ====================
resource "azurerm_private_dns_zone" "postgresql" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}

# Link da Private DNS Zone com a VNet da FIAP
# MODIFICADO: Usar vnet-fiap-tech local
resource "azurerm_private_dns_zone_virtual_network_link" "postgresql_vnet_link" {
  name                  = "postgresql-vnet-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.postgresql.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  tags                  = local.common_tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgresql_aks_vnet_link" {
  name                  = "postgresql-aks-vnet-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.postgresql.name
  virtual_network_id    = azurerm_virtual_network.aks_vnet.id
  tags                  = local.common_tags
}

resource "azurerm_private_endpoint" "postgres_endpoint_auth" {
  name                = "pe-postgresql-auth"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
  # MODIFICADO: Usar subnet da vnet-fiap-tech
  subnet_id = azurerm_subnet.private_1.id

  private_service_connection {
    name                           = "psc-postgresql-auth"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.auth.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "postgresql-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgresql.id]
  }
}

resource "azurerm_private_endpoint" "postgres_endpoint_flag" {
  name                = "pe-postgresql-flag"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
  # MODIFICADO: Usar subnet da vnet-fiap-tech
  subnet_id = azurerm_subnet.private_1.id

  private_service_connection {
    name                           = "psc-postgresql-flag"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.flag.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "postgresql-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgresql.id]
  }
}

resource "azurerm_private_endpoint" "postgres_endpoint_targeting" {
  name                = "pe-postgresql-targeting"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
  # MODIFICADO: Usar subnet da vnet-fiap-tech
  subnet_id = azurerm_subnet.private_1.id

  private_service_connection {
    name                           = "psc-postgresql-targeting"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.targeting.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "postgresql-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgresql.id]
  }
}
