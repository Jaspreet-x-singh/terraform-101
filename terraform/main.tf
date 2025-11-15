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

module "vnet" {
  source              = "./modules/virtual-network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = ["10.1.0.0/16"]
  subnets = [
    { name = "subnet-app", address_prefix = "10.1.1.0/24" },
    { name = "subnet-db", address_prefix = "10.1.2.0/24" },
    { name = "subnet-public", address_prefix = "10.1.3.0/24" },
  ]
  tags = {
    environment = "dev"
    owner       = "terraform"
  }
}

module "storage" {
  source                   = "./modules/storage-account"
  storage_account_name     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

module "appserviceplan" {
  source                = "./modules/app-service-plan"
  app_service_plan_name = var.app_service_plan_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  app_service_plan = {
    tier = var.app_service_plan.tier
    size = var.app_service_plan.size
  }
}
