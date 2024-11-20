variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group where the ACR will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the ACR will be deployed"
  type        = string
}

variable "admin_enabled" {
  description = "Enable admin access for the ACR"
  type        = bool
  default     = true
}
