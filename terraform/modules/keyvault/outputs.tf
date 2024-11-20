output "keyvault_id" {
  value = azurerm_key_vault.keyvault.id
}

output "secret_uri" {
  value = azurerm_key_vault_secret.application_secret.id
}
