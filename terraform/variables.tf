variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "rg-terraform-101"
  type        = string
}
variable "location" {
  description = "The location of the resource group"
  default     = "australiaeast"
  type        = string
}
variable "storage_account_name" {
  description = "The name of the storage account"
  default     = "stterraformbasics02"
  type        = string
}
variable "account_tier" {
  description = "The tier of the storage account"
  default     = "Standard"
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  default     = "LRS"
  type        = string
}
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "VNet address space (list of CIDR blocks)"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "List of subnets to create. Each item must have name and address_prefix"
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = []
}

variable "tags" {
  description = "Optional tags applied to created resources"
  type        = map(string)
  default     = {}
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  default     = "asp-terraform-101"
  type        = string
}

variable "app_service_plan" {
  description = "The App Service Tier and SKU"
  default = {
    tier = "Basic"
    size = "B1"
  }
  type = map(any)
}

