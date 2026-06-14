terraform {
  backend "azurerm" {
    resource_group_name  = "rg-fiap-tech-challange-fase-5"
    storage_account_name = "safiaptechchallangetf5"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}