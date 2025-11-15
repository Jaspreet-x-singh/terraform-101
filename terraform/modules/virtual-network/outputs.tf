output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "Map of subnet name -> id"
  value       = { for k, s in azurerm_subnet.subnet : k => s.id }
}

