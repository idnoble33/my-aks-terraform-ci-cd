
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features        {}
  resource_provider_registrations = "none" 
}

# Resource Group
resource "azurerm_resource_group" "candidate_rg" {
  name     = var.resource_group_name
  location = var.location
}

# ACR Module
module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
  admin_enabled       = true
}

# VM Module
module "vm" {
  source              = "./modules/vm"
  vm_name             = var.vm_name
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
  vm_size             = var.vm_size
  admin_user          = var.admin_user
  ssh_key_path        = var.ssh_key_path
  subnet_id           = var.subnet_id
}

# Key Vault Module
module "keyvault" {
  source              = "./modules/keyvault"
  keyvault_name       = var.keyvault_name
  location            = azurerm_resource_group.candidate_rg.location
  resource_group_name = azurerm_resource_group.candidate_rg.name
  secret_name         = var.secret_name
  secret_value        = var.secret_value
  tenant_id           = var.tenant_id
}

# AKS Module
module "aks" {
  source              = "./modules/aks"
  aks_name            = var.aks_name
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
  dns_prefix          = var.dns_prefix
  vm_size             = var.aks_vm_size
  node_count          = var.aks_node_count
  extra_pool_vm_size  = var.extra_pool_vm_size
  extra_pool_node_count = var.extra_pool_node_count
}

# Update Inventory File (Ansible Integration)
resource "null_resource" "update_inventory" {
  depends_on = [module.vm]

  provisioner "local-exec" {
    command = <<EOT
      echo "[jenkins_server]" > ${path.module}/../ansible/inventory.ini
      echo "${module.vm.public_ip} ansible_user=${var.admin_user} ansible_ssh_private_key_file=${var.ssh_key_path}" >> ${path.module}/../ansible/inventory.ini
    EOT
  }
}

