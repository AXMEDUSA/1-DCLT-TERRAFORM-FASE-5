# Storage Account (necessária para Queue)
resource "azurerm_storage_account" "sa-solidarytech" {
  name                     = "sasolidarytechf5"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

# Fila de mensagens (tipo SQS)
resource "azurerm_storage_queue" "queue" {
  name               = "fila-solidarytech"
  storage_account_id = azurerm_storage_account.sa-solidarytech.id
}