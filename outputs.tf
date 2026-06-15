output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_public_1" {
  value = azurerm_subnet.public_1.id
}

output "subnet_private_1" {
  value = azurerm_subnet.private_1.id
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

output "redis_hostname" {
  value = azurerm_managed_redis.redis.hostname
}

output "redis_port" {
  value = azurerm_managed_redis.redis.default_database[0].port
}

output "tfstate_storage_account" {
  value = azurerm_storage_account.tfstate.name
}

output "tfstate_container" {
  value = azurerm_storage_container.tfstate.name
}

output "queue_storage_account" {
  value = azurerm_storage_account.sa_solidarytech.name
}

output "queue_donations" {
  value = azurerm_storage_queue.donations.name
}

output "queue_volunteers" {
  value = azurerm_storage_queue.volunteers.name
}

output "cosmos_account_name" {
  value = azurerm_cosmosdb_account.cosmos.name
}

output "cosmos_table_ongs" {
  value = azurerm_cosmosdb_table.ongs.name
}

output "postgres_ngo_fqdn" {
  value = azurerm_postgresql_flexible_server.ngo.fqdn
}

output "postgres_donation_fqdn" {
  value = azurerm_postgresql_flexible_server.donation.fqdn
}

output "postgres_volunteer_fqdn" {
  value = azurerm_postgresql_flexible_server.volunteer.fqdn
}

output "private_endpoint_ids" {
  value = [
    azurerm_private_endpoint.postgres_endpoint_ngo.id,
    azurerm_private_endpoint.postgres_endpoint_donation.id,
    azurerm_private_endpoint.postgres_endpoint_volunteer.id,
  ]
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.aks.id
}
