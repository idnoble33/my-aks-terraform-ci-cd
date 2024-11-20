resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Basic" # Options: Basic, Standard, Premium
  admin_enabled            = var.admin_enabled

  tags = {
    environment = "Dev"
    project     = "CICD"
  }
}
