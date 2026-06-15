resource "azurerm_managed_redis" "redis" {
  name                      = "redis-solidarytech-f5"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  sku_name                  = "Balanced_B0"
  high_availability_enabled = false
  public_network_access     = "Enabled"
  tags                      = merge(local.common_tags, { Service = "donation-service" })

  default_database {
    access_keys_authentication_enabled = true
  }
}
