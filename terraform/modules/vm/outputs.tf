output "public_ip" {
  description = "The public IP address of the virtual machine."
  value       = azurerm_public_ip.vm_ip.ip_address
}

output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_virtual_machine.vm.id
}
