resource "random_string" "suffix" {
  length  = 8
  special = false   # not include special characters
  upper   = false   # not include uppercase characters
  numeric = true    # not include numeric characters in the string
}
resource "azurerm_container_registry" "acr" {
  name                = "myacrname123"
  location            = var.resource_group.location  # From resource_group object
  resource_group_name = var.resource_group_name      # From resource_group_name string
  sku                 = "Basic"
  admin_enabled       = var.admin_enabled

}
