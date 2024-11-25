# Provider Configuration
provider "azurerm" {
  features {}
}

resource "random_string" "suffix" {
  length  = 8
  special = false # not include special characters
  upper   = false # not include uppercase characters
  numeric = true  # not Include numeric characters in the string
}

# Data Sources
data "azurerm_client_config" "current" {}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "examplerg${random_string.suffix.result}"
  location = "West US"
}

# Virtual Network and Subnet
resource "azurerm_virtual_network" "vnet" {
  name                = "examplevnet${random_string.suffix.result}"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "examplesubnet-${random_string.suffix.result}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}
resource "azurerm_public_ip" "vm_ip" {
  name                = "vm-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static" # Static allocation is required for Standard SKU
  sku                 = "Standard"
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "examplenic-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Modules
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "acr" {
  source = "./modules/acr"

  resource_group = {
    name     = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  }

  resource_group_name = azurerm_resource_group.rg.name
  acr_name            = "myacrname${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  admin_enabled       = true
}

module "aks" {
  source = "./modules/aks"

  resource_group_name = azurerm_resource_group.rg.name
  resource_group = {
    name     = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  }

  cluster_name  = "example-aks${random_string.suffix.result}"
  dns_prefix    = "exampledns${random_string.suffix.result}"
  node_count    = 2
  vm_size       = "Standard_DS2_v2" # Updated VM size
  client_id     = var.client_id     # Pass the variable
  client_secret = var.client_secret # Pass the variable
}

module "vm" {
  source                = "./modules/vm"
  vm_name               = "jenkinsvm-${random_string.suffix.result}"
  resource_group_name   = azurerm_resource_group.rg.name # Pass only the name
  location              = azurerm_resource_group.rg.location
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  ssh_key               = file(var.ssh_key_path)
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B2ms" # Updated VM size
  resource_group        = var.resource_group_name
}

module "keyvault" {
  source              = "./modules/keyvault"
  keyvault_name       = "jenkinskeyvault${random_id.suffix.hex}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

# Random ID for Key Vault Suffix
resource "random_id" "suffix" {
  byte_length = 4
}

# Null Resource for Ansible Inventory Update
resource "null_resource" "update_inventory_and_run_playbook" {
  depends_on = [azurerm_public_ip.vm_ip]

  provisioner "local-exec" {
    command = <<EOT
    # Update inventory file
    echo "[jenkins_server]" > ${path.module}/../ansible/inventory.ini
    echo "${azurerm_public_ip.vm_ip.ip_address} ansible_user=azureuser ansible_ssh_private_key_file=${var.ssh_key_path}" >> ${path.module}/../ansible/inventory.ini

    # Run the Ansible playbook
    ansible-playbook -i ${path.module}/../ansible/inventory.ini ${path.module}/../ansible/playbook.yml
    EOT
  }
}

