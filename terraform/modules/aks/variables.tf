variable "aks_name" {
  description = "Name of the AKS cluster"
}

variable "location" {
  description = "Location for AKS"
}

variable "resource_group_name" {
  description = "Resource group for AKS"
}

variable "dns_prefix" {
  description = "DNS prefix for the cluster"
}

variable "vm_size" {
  description = "VM size for the default node pool"
  default     = "Standard_DS2_v2"
}

variable "node_count" {
  description = "Node count for the default pool"
  default     = 1
}

variable "extra_pool_vm_size" {
  description = "VM size for the extra node pool"
  default     = "Standard_B2s"
}

variable "extra_pool_node_count" {
  description = "Node count for the extra pool"
  default     = 1
}
