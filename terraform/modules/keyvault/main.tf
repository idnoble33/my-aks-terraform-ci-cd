resource "random_id" "suffix" {
  byte_length = 8
}
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "keyvault" {
  name                        = "kv-${random_id.suffix.hex}"  # Adjust to meet length requirements
  resource_group_name         = var.resource_group_name
  location                    = var.location
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
}