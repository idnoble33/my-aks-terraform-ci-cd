output "resource_group_name" {
  value = azurerm_resource_group.candidate_rg.name
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "acr_id" {
  value = module.acr.acr_id
}

output "vm_ip" {
  description = "The public IP address of the virtual machine."
  value       = module.vm.public_ip
}

output "keyvault_id" {
  value = module.keyvault.keyvault_id
}

output "secret_uri" {
  value = module.keyvault.secret_uri
}

output "aks_id" {
  value = module.aks.aks_id
}

output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}
