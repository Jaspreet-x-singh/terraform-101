terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg-resources"
    storage_account_name = "stterraformbasics01"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}

module "RG" {
  source              = "./modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage" {
  source                   = "./modules/storage-account"
  storage_account_name     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
