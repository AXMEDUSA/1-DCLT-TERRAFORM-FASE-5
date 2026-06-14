variable "project" {
  type    = string
  default = "SolidaryTech"
}

variable "environment" {
  type    = string
  default = "Production"
}

variable "owner" {
  type    = string
  default = "FIAP-Team"
}

variable "cost_center" {
  type    = string
  default = "NGO-Core"
}

variable "created_by" {
  type    = string
  default = "Terraform"
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}

locals {
  finops_tags = {
    Project     = var.project
    Environment = var.environment
    Owner       = var.owner
    CostCenter  = var.cost_center
    CreatedBy   = var.created_by
    ManagedBy   = "Terraform"
  }

  # Conjunto padrao de tags FinOps, extensivel por ambiente.
  common_tags = merge(local.finops_tags, var.extra_tags)
}
