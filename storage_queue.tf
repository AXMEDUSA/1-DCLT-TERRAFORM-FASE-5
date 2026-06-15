resource "azurerm_storage_account" "sa_solidarytech" {
  name                     = "sasolidarytechf5"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(local.common_tags, { Service = "donation-service" })
}

resource "azurerm_storage_queue" "donations" {
  name               = "queue-donations"
  storage_account_id = azurerm_storage_account.sa_solidarytech.id
}

resource "azurerm_storage_queue" "volunteers" {
  name               = "queue-volunteers"
  storage_account_id = azurerm_storage_account.sa_solidarytech.id
}
