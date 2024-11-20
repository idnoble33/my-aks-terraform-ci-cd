variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_user" {
  description = "Admin username for the virtual machine."
  type        = string
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the VM will be deployed."
  type        = string
}
