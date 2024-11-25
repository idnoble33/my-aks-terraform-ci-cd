variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure Container Registry will be created."
  type        = string
}

variable "location" {
  description = "Azure Region"
  type = string
  default     = "westus"
}

variable "admin_enabled" {
  description = "Enable admin access for ACR"
  type        = bool
  default     = true
}
variable "resource_group" {
  description = "Resource group details"
  type        = object({
    name     = string
    location = string
  })
}
