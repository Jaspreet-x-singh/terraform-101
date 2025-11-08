terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg-resources"
    storage_account_name = "stterraformbasics01"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}

module "RG" {
  source   = "./modules/resource-group"
  rgname   = var.rgname
  location = var.location
}
