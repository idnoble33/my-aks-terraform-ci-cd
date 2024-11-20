# Declare the azurerm_client_config data source to get the tenant ID
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                = "${var.keyvault_name}-kv"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id  # Correct tenant_id reference

#   soft_delete_enabled     = true
  purge_protection_enabled = true
}

resource "azurerm_key_vault_secret" "application_secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.keyvault.id
}
