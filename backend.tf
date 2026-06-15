terraform {
  backend "azurerm" {
    resource_group_name  = "rg-solidarytech-fase5"
    storage_account_name = "sasolidarytechstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
