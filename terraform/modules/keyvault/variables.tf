variable "keyvault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "location" {
  description = "Azure location for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret in the Key Vault"
  type        = string
}

variable "secret_value" {
  description = "Value of the secret to be stored"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID"
  type        = string
}

