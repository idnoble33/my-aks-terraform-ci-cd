resource "random_id" "acr_suffix" {
  byte_length = 8
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.acr_name}-${random_id.acr_suffix.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                  = "Basic"

  tags = {
    environment = "Dev"
    project     = "CICD"
  }

  admin_enabled = var.admin_enabled
}
