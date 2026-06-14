resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "cosmosdb-solidarytech-fase-5"
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags

  offer_type = "Standard"
  kind       = "GlobalDocumentDB"



  consistency_policy {
    consistency_level = "Session"
  }

  capabilities {
    name = "EnableTable"
  }

  capabilities {
    name = "EnableServerless"
  }

  geo_location {
    location          = "eastus2"
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_table" "table" {
  name                = "solidarytech"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}
