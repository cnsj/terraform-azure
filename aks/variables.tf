variable "aks_location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
  default = "southeastasia"
}
variable "aks_resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "rgdev"
}
variable "aks_client_id" {
  type        = string
  description = "(Optional) The Client ID (appId) for the Service Principal used for the AKS deployment"
  default     = ""
  nullable    = false
}

variable "aks_client_secret" {
  type        = string
  description = "(Optional) The Client Secret (password) for the Service Principal used for the AKS deployment"
  default     = ""
  nullable    = false
}