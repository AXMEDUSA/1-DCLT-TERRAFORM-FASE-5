variable "location" {
  type    = string
  default = "eastus2"
}

variable "resource_group_name" {
  type    = string
  default = "rg-fiap-tech-challange-fase-5"
}

variable "acr_name" {
  type    = string
  default = "toggleacrfase5" # precisa ser único globalmente
}

variable "aks_location" {
  type        = string
  description = "Região usada para criar o AKS e a VNet dedicada do cluster"
  default     = "centralus"
}

variable "aks_vm_size" {
  type        = string
  description = "Tamanho da VM usada nos node pools do AKS"
  default     = "Standard_D2_v4"
}

variable "db_admin_password" {
  type        = string
  description = "Senha do administrador PostgreSQL"
  sensitive   = true
}
