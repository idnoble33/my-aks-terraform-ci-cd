output "vm_public_ip" {
  value = azurerm_public_ip.vm_ip.ip_address
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.aks_cluster_name
}

output "keyvault_uri" {
  value = module.keyvault.keyvault_uri
}
output "ssh_key_test" {
  value = file(var.ssh_key_path)
}
