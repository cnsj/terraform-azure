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
  network_resource_group_name = azurerm_resource_group.example.name
  network_location = azurerm_resource_group.example.location
  virtual_network_name = var.virtual_network_name
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

resource "azurerm_storage_share" "testshare" {
  name                 = "aks-storage-share"
  storage_account_name = "${azurerm_storage_account.example.name}"
  quota                = 5
}

module "aks" {
  source = "./aks"
  aks_resource_group_name = azurerm_resource_group.example.name
  aks_location = azurerm_resource_group.example.location  
  aks_client_id=var.client_id
  aks_client_secret=var.client_secret
}
