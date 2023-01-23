variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
  default = "southeastasia"
}

variable "virtual_network_name" {
  description = "The name of the virtual network name"
  type        = string
  default = "vnet"
}