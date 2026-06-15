resource "azurerm_private_dns_zone" "postgresql" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}

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

resource "azurerm_private_endpoint" "postgres_endpoint_ngo" {
  name                = "pe-postgresql-ngo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_1.id
  tags                = local.common_tags

  private_service_connection {
    name                           = "psc-postgresql-ngo"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.ngo.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "postgresql-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgresql.id]
  }
}

resource "azurerm_private_endpoint" "postgres_endpoint_donation" {
  name                = "pe-postgresql-donation"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_1.id
  tags                = local.common_tags

  private_service_connection {
    name                           = "psc-postgresql-donation"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.donation.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "postgresql-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgresql.id]
  }
}

resource "azurerm_private_endpoint" "postgres_endpoint_volunteer" {
  name                = "pe-postgresql-volunteer"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_1.id
  tags                = local.common_tags

  private_service_connection {
    name                           = "psc-postgresql-volunteer"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.volunteer.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "postgresql-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgresql.id]
  }
}
