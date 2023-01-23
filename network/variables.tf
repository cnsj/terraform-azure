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