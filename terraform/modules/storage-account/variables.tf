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
