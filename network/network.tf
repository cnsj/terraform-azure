resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.network_location
  resource_group_name = var.network_resource_group_name
}

resource "azurerm_subnet" "example" {
  name                 = "testsubnet"
  resource_group_name  = var.network_resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.3.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}