variable "vm_name" {
  description = "Name of the VM"
}

 variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_D2ads_v6"
}

variable "location" {
  description = "Azure region"
  type = string
}

variable "admin_username" {
  description = "Admin username for the VM"
}

variable "ssh_key" {
  description = "Public SSH key for VM access"
}

variable "network_interface_ids" {
  description = "List of network interface IDs for the VM"
}

variable "resource_group_name" {
  description = "The name of the resource group where ACR will be created."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
}

variable "resource_group" {
  description = "The resource group object for the VM."
  type        = any
}

variable "ssh_key_path" {
  description = "The path to the SSH private key file used for SSH authentication"
  type        = string
  default     = "/Users/noble/.ssh/id_rsa_new.pub"  # Modify this to the appropriate default or leave it without the default for input
}
