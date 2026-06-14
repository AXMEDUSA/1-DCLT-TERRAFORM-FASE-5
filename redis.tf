resource "azurerm_managed_redis" "redis" {
  name                      = "redis-solidarytech-fase-5"
  location                  = "eastus2"
  resource_group_name       = azurerm_resource_group.rg.name
  sku_name                  = "Balanced_B0"
  high_availability_enabled = false
  public_network_access     = "Enabled"
  tags                      = local.common_tags

  default_database {
    access_keys_authentication_enabled = true
  }
}
