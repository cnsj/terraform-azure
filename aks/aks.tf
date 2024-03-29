resource "random_pet" "prefix" {}


resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = var.aks_location
  resource_group_name = var.aks_resource_group_name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.aks_client_id
    client_secret = var.aks_client_secret
  }

  tags = {
    environment = "Demo"
  }
}