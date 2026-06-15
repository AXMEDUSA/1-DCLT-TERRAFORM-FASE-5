variable "location" {
  type    = string
  default = "eastus2"
}

variable "resource_group_name" {
  type    = string
  default = "rg-solidarytech-fase5"
}

variable "acr_name" {
  type    = string
  default = "acrsolidarytechf5"
}

variable "aks_location" {
  type        = string
  description = "Região usada para criar o AKS e a VNet dedicada do cluster"
  default     = "centralus"
}

variable "aks_vm_size" {
  type        = string
  description = "Tamanho da VM usada nos node pools do AKS"
  default     = "Standard_D2s_v3"
}

variable "aks_node_count" {
  type        = number
  description = "Número de nós no node pool padrão"
  default     = 2
}

variable "db_admin_password" {
  type        = string
  description = "Senha do administrador PostgreSQL"
  sensitive   = true
}

variable "pg_location" {
  type        = string
  description = "Região para os servidores PostgreSQL Flexible (eastus2 restringe esta subscription)"
  default     = "centralus"
}
