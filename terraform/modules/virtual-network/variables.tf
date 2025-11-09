variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure location for resources"
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
