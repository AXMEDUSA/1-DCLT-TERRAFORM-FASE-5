output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "snet-public-1" {
  value = azurerm_subnet.public_1.id
}

output "snet-private-1" {
  value = azurerm_subnet.private_1.id
}

output "redis_hostname" {
  value = azurerm_managed_redis.redis.hostname
}

output "redis_ssl_port" {
  value = azurerm_managed_redis.redis.default_database[0].port
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "tfstate_storage_account" {
  value = azurerm_storage_account.tfstate.name
}

output "tfstate_container" {
  value = azurerm_storage_container.tfstate.name
}

output "queue_storage_account" {
  value = azurerm_storage_account.sa-solidarytech.name
}

output "queue_name" {
  value = azurerm_storage_queue.queue.name
}

output "cosmos_account_name" {
  value = azurerm_cosmosdb_account.cosmos.name
}

output "cosmos_table_name" {
  value = azurerm_cosmosdb_table.table.name
}

output "postgres_auth_name" {
  value = azurerm_postgresql_flexible_server.auth.name
}

output "postgres_flag_name" {
  value = azurerm_postgresql_flexible_server.flag.name
}

output "postgres_targeting_name" {
  value = azurerm_postgresql_flexible_server.targeting.name
}

output "private_endpoint_ids" {
  value = [
    azurerm_private_endpoint.postgres_endpoint_auth.id,
    azurerm_private_endpoint.postgres_endpoint_flag.id,
    azurerm_private_endpoint.postgres_endpoint_targeting.id,
  ]
}
