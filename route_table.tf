# resource "azurerm_route_table" "rt_private" {
# name = "rt-private"
# location = azurerm_resource_group.rg.location
# resource_group_name = "rg-fiap-tech-challange"
# }


# resource "azurerm_subnet_route_table_association" "assoc_private_1" {
# subnet_id = azurerm_subnet.private_1.id
# route_table_id = azurerm_route_table.rt_private.id
# }


# # resource "azurerm_subnet_route_table_association" "assoc_private_2" {
# # subnet_id = azurerm_subnet.private_2.id
# # route_table_id = azurerm_route_table.rt_private.id
# # }