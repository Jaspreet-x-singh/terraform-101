resource "azurerm_storage_account" "storage" {
  resource_group_name      = var.resource_group_name
  name                     = var.storage_account_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
