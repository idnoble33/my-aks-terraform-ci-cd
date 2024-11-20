resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.dns_prefix}-dns"

  default_node_pool {
    name       = "default"
    vm_size    = var.vm_size
    node_count = var.node_count
  }

  identity {
    type = "SystemAssigned"
  }


  tags = {
    environment = "dev"
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "extra_pool" {
  name                = "extra"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = var.extra_pool_vm_size
  node_count          = var.extra_pool_node_count
}
