variable "network_location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
  default = "southeastasia"
}
variable "network_resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "rgdev"
}
variable "virtual_network_name" {
  description = "The name of the virtual network name"
  type        = string
  default = "vnet"
}