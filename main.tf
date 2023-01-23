resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "random" {
  length           = 6
  special          = false
  numeric = false
  upper = false
  lower = true
  
}
module "azure_network" {
  source              = "./network" 
}

resource "azurerm_storage_account" "example" {
  name                = "${var.storage_account_name}${random_string.random.id}"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [module.azure_network.subnet_id]
  }

  tags = {
    environment = "staging"
  }
}