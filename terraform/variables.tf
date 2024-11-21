
# Subscription Information
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID"
  type        = string
}

# Resource Group
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "Idowu-Candidate"
}

variable "location" {
  description = "Azure region"
  default     = "westeurope"
}

# ACR
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "myacr"
}

# VM
variable "vm_name" {
  description = "Name of the Virtual Machine"
  default     = "jenkins-vm"
}

variable "vm_size" {
  description = "Size of the VM"
  default     = "Standard_B2s"
}

variable "admin_user" {
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file"
  default     = "/Users/noble/.ssh/id_rsa.pub"
}

variable "subnet_id" {
  description = "Subnet ID for the VM network interface"
  default     = "your-subnet-id" # Replace with your actual subnet
}

# Key Vault
variable "keyvault_name" {
  description = "Name of the Key Vault"
  default     = "mykeyvault"
}

variable "secret_name" {
  description = "Name of the secret in the Key Vault"
  default     = "app-secret"
}

variable "secret_value" {
  description = "Value of the secret"
  default     = "my-super-secret"
}

# AKS
variable "aks_name" {
  description = "Name of the AKS cluster"
  default     = "myaks"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  default     = "myaksdns"
}

variable "aks_vm_size" {
  description = "VM size for AKS default pool"
  default     = "Standard_DS2_v2"
}

variable "aks_node_count" {
  description = "Node count for AKS default pool"
  default     = 1
}

variable "extra_pool_vm_size" {
  description = "VM size for AKS extra node pool"
  default     = "Standard_B2s"
}

variable "extra_pool_node_count" {
  description = "Node count for AKS extra node pool"
  default     = 1
}
