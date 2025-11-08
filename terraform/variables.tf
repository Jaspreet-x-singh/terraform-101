variable "rgname" {
  description = "The name of the resource group"
  default = "rg-terraform-101"
  type        = string
}
variable "location" {
  description = "The location of the resource group"
  default     = "australiaeast"
  type        = string
}
