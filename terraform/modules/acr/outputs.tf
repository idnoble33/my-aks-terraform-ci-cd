output "acr_login_server" {
  description = "The login server for the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  description = "The ID of the Azure Container Registry"
  value       = azurerm_container_registry.acr.id
}

output "acr_admin_username" {
  description = "Admin username for the ACR"
  value       = var.admin_enabled ? azurerm_container_registry.acr.admin_username : null
}

output "acr_admin_password" {
  description = "Admin password for the ACR"
  value       = var.admin_enabled ? azurerm_container_registry.acr.admin_password : null
  sensitive   = true
}
