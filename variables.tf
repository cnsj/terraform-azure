# Input variable definitions
variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
  default = "southeastasia"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "rgdev"
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default = "abcde"
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
  default = "Standard"
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default = "vnet"
}

variable "client_id" {
  type        = string
  description = "(Optional) The Client ID (appId) for the Service Principal used for the AKS deployment"
  default     = ""
  nullable    = false
}

variable "client_secret" {
  type        = string
  description = "(Optional) The Client Secret (password) for the Service Principal used for the AKS deployment"
  default     = ""
  nullable    = false
}