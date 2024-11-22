provider "azurerm" {
   subscription_id = var.subscription_id
  features {}
}

# data "azurerm_client_config" "current" {}

# Resource Group
resource "azurerm_resource_group" "candidate_rg" {
  name     = var.resource_group_name
  location = var.location
}

# ACR Module
module "acr" {
  source              = "./modules/acr"
  acr_name            = "myuniqueacrname"                          # Replace with your ACR name
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
  admin_enabled       = true
}

# VM Module
module "vm" {
  source              = "./modules/vm"
  vm_name             = var.vm_name
  location            = azurerm_resource_group.candidate_rg.location
  resource_group_name = azurerm_resource_group.candidate_rg.name
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
  location            = azurerm_resource_group.candidate_rg.location
  resource_group_name = azurerm_resource_group.candidate_rg.name
  dns_prefix          = var.dns_prefix
  vm_size             = var.aks_vm_size
  node_count          = var.aks_node_count
  extra_pool_vm_size  = var.extra_pool_vm_size
  extra_pool_node_count = var.extra_pool_node_count
}

resource "null_resource" "update_inventory" {
  depends_on = [module.vm]  # Ensures the VM is fully provisioned before this runs

  provisioner "local-exec" {
    command = <<EOT
    echo "[jenkins_server]" > ${path.module}/../ansible/inventory.ini
    echo "${module.vm.public_ip} ansible_user=azureuser ansible_ssh_private_key_file=${var.ssh_key_path}" >> ${path.module}/../ansible/inventory.ini
    EOT
  }
}
